library user_entity;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:tax_return/feature/tax_return/data/model/user_model/user_model.dart';

part 'user_entity.g.dart';

abstract class UserEntity implements Built<UserEntity, UserEntityBuilder> {
  @nullable
  String get id;

  String get userName;
  String get emailAddress;
  int get userContact;

  String get taxReturnType;
  //FIXME: this will later be the map of string
  //String get companyCategory;
  // bool get isYearsOfOperation;
  BuiltMap<String, Object> get cityPage;

  UserEntity._();

  factory UserEntity([Function(UserEntityBuilder b) updates]) = _$UserEntity;

  UserModel toModel() {
    return UserModel((b) => b
      ..userName = userName
      ..id = id
      ..emailAddress = emailAddress
      ..userContact = userContact
      ..taxReturnType = taxReturnType
      ..cityPage = cityPage.toBuilder());
  }

  static UserEntity fromModel(UserModel model) {
    return UserEntity((b) => b
      ..userName = model.userName
      ..emailAddress = model.emailAddress
      ..id = model.id
      ..userContact = model.userContact
      ..cityPage = model.cityPage.toBuilder()
      ..taxReturnType = model.taxReturnType);
  }
}
