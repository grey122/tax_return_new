//TODO: run better test on this repository
import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/user_model/user_model_export.dart';
import 'package:tax_return/feature/tax_return/domain/entities/user_entity/user_entity.dart';
import 'package:tax_return/feature/tax_return/domain/repositories/repositories_export.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore firebaseFirestore;
  final User authUser;
  static const String path = 'tax_return';

  //final taxReturnCollection = FirebaseFirestore.instance.collection(path);

  FirebaseUserRepository({this.firebaseFirestore, this.authUser});

  @override
  Future<void> addNewUserData(UserEntity user) {
    return firebaseFirestore
        .collection(path)
        .doc(authUser.id)
        .collection('User')
        .add(user.toModel().toDocument());
  }

  @override
  Future<void> deleteUserData(UserEntity user) {
    return firebaseFirestore
        .collection(path)
        .doc(authUser.id)
        .collection('User')
        .doc(user.id)
        .delete();
  }

  @override
  Stream<List<UserEntity>> users() {
    return firebaseFirestore
        .collection(path)
        .doc(authUser.id)
        .collection('User')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => UserEntity.fromModel(UserModel.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateUserData(UserEntity update) {
    return firebaseFirestore
        .collection(path)
        .doc(authUser.id)
        .collection('User')
        .doc(update.id)
        .update(update.toModel().toDocument());
  }
}
