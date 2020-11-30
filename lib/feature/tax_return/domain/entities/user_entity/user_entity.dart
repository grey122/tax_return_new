library user_entity;

import 'package:built_value/built_value.dart';
import 'package:tax_return/feature/tax_return/data/model/user_model/user_model.dart';

part 'user_entity.g.dart';

//TODO: fix this at nullable problem

abstract class UserEntity implements Built<UserEntity, UserEntityBuilder> {
  @nullable
  String get id;

  String get userName;
  String get emailAddress;
  int get userContact;
  String get taxReturnType;
  String get companyCategory;
  bool get isYearsOfOperation;

  UserEntity._();

  factory UserEntity([Function(UserEntityBuilder b) updates]) = _$UserEntity;

  UserModel toModel() {
    return UserModel((b) => b
      ..userName = userName
      ..id = id
      ..emailAddress = emailAddress
      ..userContact = userContact
      ..taxReturnType = taxReturnType
      ..companyCategory = companyCategory
      ..isYearsOfOperation = isYearsOfOperation);
  }

  static UserEntity fromModel(UserModel model) {
    return UserEntity((b) => b
      ..userName = model.userName
      ..emailAddress = model.emailAddress
      ..id = model.id
      ..userContact = model.userContact
      ..taxReturnType = model.taxReturnType
      ..companyCategory = model.companyCategory
      ..isYearsOfOperation = model.isYearsOfOperation);
  }
}
