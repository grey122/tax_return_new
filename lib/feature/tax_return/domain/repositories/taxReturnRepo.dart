import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';

abstract class TaxReturnRepository {
  Future<void> addNewTaxReturn(TaxReturn taxReturn);

  Future<void> deleteTaxReturn(TaxReturn taxReturn);

  Stream<List<TaxReturn>> taxReturns();

  Future<void> updateTaxReturn(TaxReturn update);
}
