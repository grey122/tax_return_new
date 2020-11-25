import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

///this is just a test class and should be removed once the concrete implementation of the class have been completed

class TaxReturnModel extends Equatable {
  final String taxName;
  final String id;

  TaxReturnModel({this.id, this.taxName});

  Map<String, Object> toJson() {
    return {
      "taxName": taxName,
      "id": id,
    };
  }

  @override
  List<Object> get props => [taxName, id];

  @override
  String toString() {
    return 'TaxReturnModel {taxName: $taxName, id: $id }';
  }

  static TaxReturnModel fromJson(Map<String, Object> json) {
    return TaxReturnModel(
      taxName: json["taxName"] as String,
      id: json["id"] as String,
    );
  }

  static TaxReturnModel fromSnapshot(DocumentSnapshot snap) {
    return TaxReturnModel(taxName: snap.data()['taxName'], id: snap.id);
  }

  Map<String, Object> toDocument() {
    return {"taxName": taxName};
  }
}
