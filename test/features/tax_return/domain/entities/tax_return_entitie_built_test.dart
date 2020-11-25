import 'package:flutter_test/flutter_test.dart';
import 'package:tax_return/feature/tax_return/data/model/model_export.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';

//for testting purpose
extension on TaxReturnBuilt {
  bool get _isTheSame {
    final String taxName = 'tunde';
    if (TaxReturnBuilt((b) => b
          ..taxName = taxName
          ..id = '') ==
        TaxReturnBuilt((b) => b
          ..taxName = taxName
          ..id = '')) {
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
      expect(
          TaxReturnBuilt((b) => b
            ..taxName = taxName
            ..id = taxId),
          TaxReturnBuilt((b) => b
            ..taxName = taxName
            ..id = taxId));
    });

    test('check if class is value comparable rather than object compareable',
        () {
      expect(
          TaxReturnBuilt((b) => b
            ..taxName = ''
            ..id = '')._isTheSame,
          true);
    });

    test('returns object with updated tax_name when taxname is passed', () {
      expect(
          TaxReturnBuilt((b) => b
            ..taxName = taxName
            ..id = taxId).rebuild((b) => b
            ..taxName = 'james'
            ..id = '1'),
          TaxReturnBuilt((b) => b
            ..taxName = 'james'
            ..id = '1'));
    });

    test('return an taxReturnModel entiy passing in taxReturn model value', () {
      expect(
          TaxReturnBuilt((b) => b
            ..taxName = taxName
            ..id = taxId).toModel(),
          TaxReturnModel(taxName: taxName, id: taxId));
    });

    test(
        'return tax_return when fromenity is called passining to ir the entit constructor value',
        () {
      final TaxReturnModel _model = TaxReturnModel(id: taxId, taxName: taxName);
      expect(
          TaxReturnBuilt.fromModel(_model),
          TaxReturnBuilt((b) => b
            ..taxName = taxName
            ..id = taxId));
    });
  });
}
