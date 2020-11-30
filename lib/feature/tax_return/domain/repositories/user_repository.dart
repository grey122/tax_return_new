import 'package:tax_return/feature/tax_return/domain/entities/user_entity/user_entity_export.dart';

abstract class UserRepository {
  Future<void> addNewUserData(UserEntity user);

  Future<void> deleteUserData(UserEntity user);

  Stream<List<UserEntity>> users();

  Future<void> updateUserData(UserEntity update);
}
