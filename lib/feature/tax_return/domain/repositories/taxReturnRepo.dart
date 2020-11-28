import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';

abstract class TaxReturnRepository {
  Future<void> addNewTaxReturn(TaxReturnBuilt taxReturn);

  Future<void> deleteTaxReturn(TaxReturnBuilt taxReturn);

  Stream<List<TaxReturnBuilt>> taxReturns();

  Future<void> updateTaxReturn(TaxReturnBuilt update);
}
