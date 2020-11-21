import 'package:flutter/cupertino.dart';
import 'package:tax_return/feature/tax_return/data/model/model_export.dart';

@immutable
class TaxReturn {
  TaxReturn({@required this.taxName, String id}) : this.id = id;
  final String taxName;
  final String id;

  TaxReturn copyWIth({
    String taxName,
    String id,
  }) {
    return TaxReturn(
      taxName: taxName ?? this.taxName,
      id: id ?? this.id,
    );
  }

  @override
  int get hashCode => taxName.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxReturn &&
          runtimeType == other.runtimeType &&
          taxName == other.taxName &&
          id == other.id;

  @override
  String toString() {
    return 'TaxReturn{taxName: $taxName, id: $id';
  }

  TaxReturnModel toModel() {
    return TaxReturnModel(taxName: taxName, id: id);
  }

  static TaxReturn fromModel(TaxReturnModel model) {
    return TaxReturn(
      taxName: model.taxName,
      id: model.id,
    );
  }
}
