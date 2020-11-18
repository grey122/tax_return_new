import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'models/models.dart';

//TODO: do some json conversion (facebook data )with the user information
//TODO: try to implement google account logged with a different user
//TODO: reserach on how to deal with google network errors
//TODO: test the excpetion call you decalerd

/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

///thrown during login with facebook failure
class LogInWithFaceBookFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    firebase_auth.FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignIn,
    FacebookLogin facebookLogin,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _facebookLogin = facebookLogin ?? FacebookLogin();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookLogin _facebookLogin;

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpFailure] if an exception occurs.
  Future<void> signUp({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw SignUpFailure();
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [FirebaseFailureMessage] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on firebase_auth.FirebaseException catch (e) {
      final FirebaseFailureMessage _firebaseFailureMessage =
          FirebaseFailureMessage(code: e.code);
      _firebaseFailureMessage.firebaseErrorMsg();
    }
  }

  Future<void> logInWithFaceBook() async {
    try {
      final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
      final fbToken = result.accessToken.token;

      if (result.status == FacebookLoginStatus.loggedIn) {
        final facebookCredential =
            firebase_auth.FacebookAuthProvider.credential(fbToken);

        await _firebaseAuth.signInWithCredential(facebookCredential);
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      final FirebaseFailureMessage _firebaseFailureMessage =
          FirebaseFailureMessage(code: e.code);
      _firebaseFailureMessage.firebaseErrorMsg();
      await fbLinkPendingCredential(e);
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [FirebaseFailureMessage] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      final FirebaseFailureMessage _firebaseFailureMessage =
          FirebaseFailureMessage(code: e.code);
      _firebaseFailureMessage.firebaseErrorMsg();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
        _facebookLogin.logOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }

  Future fbLinkPendingCredential(firebase_auth.FirebaseAuthException e) async {
    //bowrroed code from https://firebase.flutter.dev/docs/auth/error-handling/
    if (e.code == 'account-exists-with-different-credential') {
      FirebaseFailureMessage(message: 'we are all fucked in a way');
      // The account already exists with a different credential
      String email = e.email;
      firebase_auth.AuthCredential pendingCredential = e.credential;

      // Fetch a list of what sign-in methods exist for the conflicting user
      List<String> userSignInMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);

      // If the user has several sign-in methods,
      // the first method in the list will be the "recommended" method to use.
      if (userSignInMethods.first == 'password') {
        // Prompt the user to enter their password
        String password = '...';

        // Sign the user in to their account with the password
        firebase_auth.UserCredential userCredential =
            await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Link the pending credential with the existing account

        await userCredential.user.linkWithCredential(pendingCredential);
      }
      if (userSignInMethods.first == 'google.com') {
        try {
          final googleUser = await _googleSignIn.signIn();
          final googleAuth = await googleUser.authentication;

          final credential = firebase_auth.GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          firebase_auth.UserCredential userCredential =
              await _firebaseAuth.signInWithCredential(credential);
          // Link the pending credential with the existing account
          await userCredential.user.linkWithCredential(pendingCredential);
        } on firebase_auth.FirebaseAuthException {
          final FirebaseFailureMessage _firebaseFailureMessage =
              FirebaseFailureMessage(code: e.code);
          _firebaseFailureMessage.firebaseErrorMsg();
        }
      }
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
    );
  }
}

/// Thrown if any exception occors anywhere in the authenticatipon or loggin process
class FirebaseFailureMessage {
  final String code;
  final String message;

  const FirebaseFailureMessage({this.message, this.code});

  @override
  String toString() => message;

  void firebaseErrorMsg() {
    switch (code) {
      case 'wrong-password':
        throw FirebaseFailureMessage(
            code: code,
            message: 'Password incorrect, Try a different Password❌');
      case 'too-many-requests':
        throw FirebaseFailureMessage(
            code: code,
            message:
                'We have blocked all requests from this device due to unusual activity. Try again later. 🛑');
      case 'network-request-failed':
        throw FirebaseFailureMessage(
            code: code,
            message: 'Connect to Internet or Turn on your WIFI ❗🌐');
      case 'invalid-credential':
        throw FirebaseFailureMessage(
            code: code, message: 'Invalid Credential; try again ');
      case 'user-disabled':
        throw FirebaseFailureMessage(
            code: code, message: 'User have disable his account');
      case 'user-not-found':
        throw FirebaseFailureMessage(code: code, message: 'User not found');
        break;
      case 'invalid-verification-code':
        throw FirebaseFailureMessage(
            code: code, message: 'Invalid verification code');
      case 'network_error':
        throw FirebaseFailureMessage(code: code, message: 'Network error ');

      default:
        FirebaseFailureMessage(message: 'Something went wrong');
    }
  }
}
