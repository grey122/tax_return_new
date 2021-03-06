import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_return/feature/tax_return/data/repositories/firebase_tax_return_repo.dart';

import 'package:tax_return/feature/tax_return/data/repositories/firebase_user_rep.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/colors_constant.dart';

import 'package:tax_return/home_page.dart';
import 'package:tax_return/core/splash/splash_export.dart';
import 'package:tax_return/feature/authentication/presentation/screens/login/login.dart';

import 'feature/authentication/presentation/logic/bloc/bloc_export.dart';
import 'feature/tax_return/presentation/logic/bloc/bloc_export.dart';

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  App({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider<AuthenticationBloc>(
        create: (_) => AuthenticationBloc(
            authenticationRepository: authenticationRepository),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: backgroundColor),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider<UserBloc>(
                create: (_) {
                  final user = context.bloc<AuthenticationBloc>().state.user;
                  return UserBloc(
                    userRepository: FirebaseUserRepository(
                        firebaseFirestore: _firestore, authUser: user),
                  )..add(LoadUsers());
                },
              ),
              BlocProvider<TaxReturnCubit>(create: (_) {
                final user = context.bloc<AuthenticationBloc>().state.user;
                return TaxReturnCubit(
                    taxReturnRepository:
                        FirebaseTaxReturnRepository(_firestore, user))
                  ..loadTaxReturns();
              })
            ],
            child: BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    //  context.bloc<UserBloc>().add(AddUser());
                    _navigator.pushAndRemoveUntil<void>(
                      HomePage.route(),
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      LoginPage.route(),
                      (route) => false,
                    );
                    break;
                  default:
                    break;
                }
              },
              child: child,
            ));
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
