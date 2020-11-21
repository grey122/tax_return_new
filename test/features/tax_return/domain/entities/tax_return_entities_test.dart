import 'package:flutter_test/flutter_test.dart';
import 'package:tax_return/feature/tax_return/data/model/model_export.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';

//for testting purpose
extension on TaxReturn {
  bool get _isTheSame {
    final String taxName = 'tunde';
    if (TaxReturn(taxName: taxName) == TaxReturn(taxName: taxName)) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  final String taxName = 'tax_name';
  final String taxId = 'tax_id';
  group('tax_return', () {
    test('supports value comparisim', () {
      expect(TaxReturn(taxName: taxName), TaxReturn(taxName: taxName));
    });

    test('check if class is value comparable rather than object compareable',
        () {
      expect(TaxReturn(taxName: '')._isTheSame, true);
    });

    test('returns object with updated tax_name when taxname is passed', () {
      expect(TaxReturn(taxName: '').copyWIth(taxName: taxName),
          TaxReturn(taxName: taxName));
    });

    test('return an taxReturnModel entiy passing in taxReturn model value', () {
      expect(TaxReturn(taxName: taxName, id: taxId).toModel(),
          TaxReturnModel(taxName: taxName, id: taxId));
    });

    test(
        'return tax_return when fromenity is called passining to ir the entit constructor value',
        () {
      final TaxReturnModel _model = TaxReturnModel(id: taxId, taxName: taxName);
      expect(TaxReturn.fromModel(_model),
          TaxReturn(taxName: _model.taxName, id: _model.id));
    });
  });
}
