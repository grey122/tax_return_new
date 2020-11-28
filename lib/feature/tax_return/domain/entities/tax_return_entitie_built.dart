library tax_return_entitie_built;

import 'package:built_value/built_value.dart';
import 'package:tax_return/feature/tax_return/data/model/model_export.dart';
import 'package:tax_return/feature/tax_return/data/model/tax_return_model_built.dart';

part 'tax_return_entitie_built.g.dart';

abstract class TaxReturnBuilt
    implements Built<TaxReturnBuilt, TaxReturnBuiltBuilder> {
  String get taxName;
  @nullable
  String get id;
  TaxReturnBuilt._();

  factory TaxReturnBuilt([Function(TaxReturnBuiltBuilder b) updates]) =
      _$TaxReturnBuilt;

  TaxReturnModel toModel() {
    return TaxReturnModel(taxName: taxName, id: id);
  }

  static TaxReturnBuilt fromModel(TaxReturnModelBuilt model) {
    return TaxReturnBuilt((b) => b
      ..taxName = model.taxName
      ..id = model.id);
  }
}
