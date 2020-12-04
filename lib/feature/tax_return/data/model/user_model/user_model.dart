import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/serializers/serilizers_export.dart';
import 'package:built_collection/built_collection.dart';

part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  @nullable
  String get id;
  @nullable
  String get userName;
  String get emailAddress;
  String get userContact;

  String get taxReturnType;
  //FIXME: this will later be the map of string
  //String get companyCategory;
  // bool get isYearsOfOperation;
  BuiltMap<String, Object> get cityPage;

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

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    // final map = (snap.data()['citPage'] as BuiltMap).toBuilder();
    return UserModel((b) => b
      ..userName = snap.data()['user_name']
      ..emailAddress = snap.data()['email_address']
      ..userContact = snap.data()['user_contact']
      ..taxReturnType = snap.data()['tax_return_type']
      ..cityPage =
          new BuiltMap<String, Object>.from(snap.data()['citPage']).toBuilder()
      ..id = snap.id);
  }

  Map<String, Object> toDocument() {
    return {
      "user_name": userName,
      "email_address": emailAddress,
      "user_contact": userContact,
      "tax_return_type": taxReturnType,
      "citPage": cityPage.asMap()
    };
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
