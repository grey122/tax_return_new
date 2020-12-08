library tax_return_entitie_built;

import 'package:built_value/built_value.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/model_export.dart';
import 'package:tax_return/feature/tax_return/data/model/tax_return_model_built.dart';

part 'tax_return_entitie_built.g.dart';

//FIXME: remove all the unneccsary nullable
abstract class TaxReturnBuilt
    implements Built<TaxReturnBuilt, TaxReturnBuiltBuilder> {
  int get grossProfit;
  int get grossRevenue;

  /// Net Profit (before tax)
  int get generalAdminExpenses;

  /// Taxable income(loss brought foward)
  int get dissallowedExpenses;

  /// Taxable income(loss brought foward)
  int get noTaxableProfit;

  /// Taxable income
  @nullable
  int get balanceAdjustment;

  /// Taxable income
  int get capitalAllowance;

  /// Taxable income
  int get paidCapital;

  /// 30% of TaxableIncome
  @nullable
  int get predictedTax;

  @nullable
  String get id;

  Timestamp get currentDate;

  TaxReturnBuilt._();

  factory TaxReturnBuilt([Function(TaxReturnBuiltBuilder b) updates]) =
      _$TaxReturnBuilt;

  TaxReturnModelBuilt toModel() {
    return TaxReturnModelBuilt((b) => b
      ..grossProfit = grossProfit
      ..grossRevenue = grossRevenue
      ..generalAdminExpenses = generalAdminExpenses
      ..dissallowedExpenses = dissallowedExpenses
      ..noTaxableProfit = noTaxableProfit
      ..capitalAllowance = capitalAllowance
      ..paidCapital = paidCapital
      ..predictedTax = predictedTax
      ..balanceAdjustment = balanceAdjustment
      ..currentDate = currentDate
      ..id = id);
  }

  static TaxReturnBuilt fromModel(TaxReturnModelBuilt model) {
    return TaxReturnBuilt((b) => b
      ..grossProfit = model.grossProfit
      ..grossRevenue = model.grossRevenue
      ..generalAdminExpenses = model.generalAdminExpenses
      ..dissallowedExpenses = model.dissallowedExpenses
      ..noTaxableProfit = model.noTaxableProfit
      ..capitalAllowance = model.capitalAllowance
      ..paidCapital = model.paidCapital
      ..balanceAdjustment = model.balanceAdjustment
      ..predictedTax = model.predictedTax
      ..currentDate = model.currentDate
      ..id = model.id);
  }
}
