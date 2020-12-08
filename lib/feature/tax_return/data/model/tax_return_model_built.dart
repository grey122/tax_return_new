library tax_return_model_built;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/serializers/serilizers_export.dart';

part 'tax_return_model_built.g.dart';
//TODO: create date stamp id

abstract class TaxReturnModelBuilt
    implements Built<TaxReturnModelBuilt, TaxReturnModelBuiltBuilder> {
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
      ..grossProfit = snap.data()['gross_profit']
      ..grossRevenue = snap.data()['gross_revenue']
      ..generalAdminExpenses = snap.data()['general_admin_expenses']
      ..dissallowedExpenses = snap.data()['dissallowed_Expenses']
      ..noTaxableProfit = snap.data()['noTaxable_profit']
      ..capitalAllowance = snap.data()['capital_allowance']
      ..paidCapital = snap.data()['paid_capital']
      ..currentDate = snap.data()['current_date']
      //FIXME: fix this string when done
      ..predictedTax = snap.data()['predictedTax']
      ..balanceAdjustment = snap.data()['balance_adjustment']
      ..id = snap.id);
  }

  Map<String, Object> toDocument() {
    return {
      "gross_profit": grossProfit,
      "gross_revenue": grossRevenue,
      "general_admin_expenses": generalAdminExpenses,
      "dissallowed_Expenses": dissallowedExpenses,
      "noTaxable_profit": noTaxableProfit,
      "capital_allowance": capitalAllowance,
      "paid_capital": paidCapital,
      "predictedTax": predictedTax,
      "balance_adjustment": balanceAdjustment,
      "current_date": currentDate
    };
  }

  static Serializer<TaxReturnModelBuilt> get serializer =>
      _$taxReturnModelBuiltSerializer;
}
