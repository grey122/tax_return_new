library tax_return_model_built;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/serializers.dart';

part 'tax_return_model_built.g.dart';

abstract class TaxReturnModelBuilt
    implements Built<TaxReturnModelBuilt, TaxReturnModelBuiltBuilder> {
  String get taxName;
  @nullable
  String get id;

  TaxReturnModelBuilt._();

  factory TaxReturnModelBuilt(
      [Function(TaxReturnModelBuiltBuilder b) updates]) = _$TaxReturnModelBuilt;

  String toJson() {
    return json.encode(
        serializers.serializeWith(TaxReturnModelBuilt.serializer, this));
  }

  static TaxReturnModelBuilt fromJson(String jsonString) {
    return serializers.deserializeWith(
        TaxReturnModelBuilt.serializer, json.decode(jsonString));
  }

  static TaxReturnModelBuilt fromSnapshot(DocumentSnapshot snap) {
    return TaxReturnModelBuilt((b) => b
      ..taxName = snap.data()['taxName']
      ..id = snap.id);
  }

  Map<String, Object> toDocument() {
    return {"taxName": taxName};
  }

  static Serializer<TaxReturnModelBuilt> get serializer =>
      _$taxReturnModelBuiltSerializer;
}
