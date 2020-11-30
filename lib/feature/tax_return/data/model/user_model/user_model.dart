import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/serializers/serilizers_export.dart';

part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  @nullable
  String get id;
  @nullable
  String get userName;
  String get emailAddress;
  int get userContact;
  String get taxReturnType;
  String get companyCategory;
  bool get isYearsOfOperation;

  // fields go here

  UserModel._();

  factory UserModel([Function(UserModelBuilder b) updates]) = _$UserModel;

  String toJson() {
    return json.encode(serializers.serializeWith(UserModel.serializer, this));
  }

  static UserModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserModel.serializer, json.decode(jsonString));
  }

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    return UserModel((b) => b
      ..userName = snap.data()['user_name']
      ..emailAddress = snap.data()['email_address']
      ..userContact = snap.data()['user_contact']
      ..companyCategory = snap.data()['company_category']
      ..taxReturnType = snap.data()['cit.tax_return_type']
      ..id = snap.id
      ..isYearsOfOperation = snap.data()['cit.iis_years_of_operation']);
  }

  Map<String, Object> toDocument() {
    return {
      "user_name": userName,
      "email_address": emailAddress,
      "user_contact": userContact,
      "cit.tax_return_type": taxReturnType,
      "cit.is_years_of_operation": isYearsOfOperation
    };
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
