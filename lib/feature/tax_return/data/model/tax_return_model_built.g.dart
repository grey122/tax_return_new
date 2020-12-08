// GENERATED CODE - DO NOT MODIFY BY HAND

part of tax_return_model_built;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaxReturnModelBuilt> _$taxReturnModelBuiltSerializer =
    new _$TaxReturnModelBuiltSerializer();

class _$TaxReturnModelBuiltSerializer
    implements StructuredSerializer<TaxReturnModelBuilt> {
  @override
  final Iterable<Type> types = const [
    TaxReturnModelBuilt,
    _$TaxReturnModelBuilt
  ];
  @override
  final String wireName = 'TaxReturnModelBuilt';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TaxReturnModelBuilt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'grossProfit',
      serializers.serialize(object.grossProfit,
          specifiedType: const FullType(int)),
      'grossRevenue',
      serializers.serialize(object.grossRevenue,
          specifiedType: const FullType(int)),
      'generalAdminExpenses',
      serializers.serialize(object.generalAdminExpenses,
          specifiedType: const FullType(int)),
      'dissallowedExpenses',
      serializers.serialize(object.dissallowedExpenses,
          specifiedType: const FullType(int)),
      'noTaxableProfit',
      serializers.serialize(object.noTaxableProfit,
          specifiedType: const FullType(int)),
      'capitalAllowance',
      serializers.serialize(object.capitalAllowance,
          specifiedType: const FullType(int)),
      'paidCapital',
      serializers.serialize(object.paidCapital,
          specifiedType: const FullType(int)),
      'currentDate',
      serializers.serialize(object.currentDate,
          specifiedType: const FullType(Timestamp)),
    ];
    if (object.balanceAdjustment != null) {
      result
        ..add('balanceAdjustment')
        ..add(serializers.serialize(object.balanceAdjustment,
            specifiedType: const FullType(int)));
    }
    if (object.predictedTax != null) {
      result
        ..add('predictedTax')
        ..add(serializers.serialize(object.predictedTax,
            specifiedType: const FullType(int)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TaxReturnModelBuilt deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaxReturnModelBuiltBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'grossProfit':
          result.grossProfit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'grossRevenue':
          result.grossRevenue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'generalAdminExpenses':
          result.generalAdminExpenses = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'dissallowedExpenses':
          result.dissallowedExpenses = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'noTaxableProfit':
          result.noTaxableProfit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'balanceAdjustment':
          result.balanceAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'capitalAllowance':
          result.capitalAllowance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'paidCapital':
          result.paidCapital = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'predictedTax':
          result.predictedTax = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'currentDate':
          result.currentDate = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
      }
    }

    return result.build();
  }
}

class _$TaxReturnModelBuilt extends TaxReturnModelBuilt {
  @override
  final int grossProfit;
  @override
  final int grossRevenue;
  @override
  final int generalAdminExpenses;
  @override
  final int dissallowedExpenses;
  @override
  final int noTaxableProfit;
  @override
  final int balanceAdjustment;
  @override
  final int capitalAllowance;
  @override
  final int paidCapital;
  @override
  final int predictedTax;
  @override
  final String id;
  @override
  final Timestamp currentDate;

  factory _$TaxReturnModelBuilt(
          [void Function(TaxReturnModelBuiltBuilder) updates]) =>
      (new TaxReturnModelBuiltBuilder()..update(updates)).build();

  _$TaxReturnModelBuilt._(
      {this.grossProfit,
      this.grossRevenue,
      this.generalAdminExpenses,
      this.dissallowedExpenses,
      this.noTaxableProfit,
      this.balanceAdjustment,
      this.capitalAllowance,
      this.paidCapital,
      this.predictedTax,
      this.id,
      this.currentDate})
      : super._() {
    if (grossProfit == null) {
      throw new BuiltValueNullFieldError('TaxReturnModelBuilt', 'grossProfit');
    }
    if (grossRevenue == null) {
      throw new BuiltValueNullFieldError('TaxReturnModelBuilt', 'grossRevenue');
    }
    if (generalAdminExpenses == null) {
      throw new BuiltValueNullFieldError(
          'TaxReturnModelBuilt', 'generalAdminExpenses');
    }
    if (dissallowedExpenses == null) {
      throw new BuiltValueNullFieldError(
          'TaxReturnModelBuilt', 'dissallowedExpenses');
    }
    if (noTaxableProfit == null) {
      throw new BuiltValueNullFieldError(
          'TaxReturnModelBuilt', 'noTaxableProfit');
    }
    if (capitalAllowance == null) {
      throw new BuiltValueNullFieldError(
          'TaxReturnModelBuilt', 'capitalAllowance');
    }
    if (paidCapital == null) {
      throw new BuiltValueNullFieldError('TaxReturnModelBuilt', 'paidCapital');
    }
    if (currentDate == null) {
      throw new BuiltValueNullFieldError('TaxReturnModelBuilt', 'currentDate');
    }
  }

  @override
  TaxReturnModelBuilt rebuild(
          void Function(TaxReturnModelBuiltBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaxReturnModelBuiltBuilder toBuilder() =>
      new TaxReturnModelBuiltBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaxReturnModelBuilt &&
        grossProfit == other.grossProfit &&
        grossRevenue == other.grossRevenue &&
        generalAdminExpenses == other.generalAdminExpenses &&
        dissallowedExpenses == other.dissallowedExpenses &&
        noTaxableProfit == other.noTaxableProfit &&
        balanceAdjustment == other.balanceAdjustment &&
        capitalAllowance == other.capitalAllowance &&
        paidCapital == other.paidCapital &&
        predictedTax == other.predictedTax &&
        id == other.id &&
        currentDate == other.currentDate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, grossProfit.hashCode),
                                            grossRevenue.hashCode),
                                        generalAdminExpenses.hashCode),
                                    dissallowedExpenses.hashCode),
                                noTaxableProfit.hashCode),
                            balanceAdjustment.hashCode),
                        capitalAllowance.hashCode),
                    paidCapital.hashCode),
                predictedTax.hashCode),
            id.hashCode),
        currentDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaxReturnModelBuilt')
          ..add('grossProfit', grossProfit)
          ..add('grossRevenue', grossRevenue)
          ..add('generalAdminExpenses', generalAdminExpenses)
          ..add('dissallowedExpenses', dissallowedExpenses)
          ..add('noTaxableProfit', noTaxableProfit)
          ..add('balanceAdjustment', balanceAdjustment)
          ..add('capitalAllowance', capitalAllowance)
          ..add('paidCapital', paidCapital)
          ..add('predictedTax', predictedTax)
          ..add('id', id)
          ..add('currentDate', currentDate))
        .toString();
  }
}

class TaxReturnModelBuiltBuilder
    implements Builder<TaxReturnModelBuilt, TaxReturnModelBuiltBuilder> {
  _$TaxReturnModelBuilt _$v;

  int _grossProfit;
  int get grossProfit => _$this._grossProfit;
  set grossProfit(int grossProfit) => _$this._grossProfit = grossProfit;

  int _grossRevenue;
  int get grossRevenue => _$this._grossRevenue;
  set grossRevenue(int grossRevenue) => _$this._grossRevenue = grossRevenue;

  int _generalAdminExpenses;
  int get generalAdminExpenses => _$this._generalAdminExpenses;
  set generalAdminExpenses(int generalAdminExpenses) =>
      _$this._generalAdminExpenses = generalAdminExpenses;

  int _dissallowedExpenses;
  int get dissallowedExpenses => _$this._dissallowedExpenses;
  set dissallowedExpenses(int dissallowedExpenses) =>
      _$this._dissallowedExpenses = dissallowedExpenses;

  int _noTaxableProfit;
  int get noTaxableProfit => _$this._noTaxableProfit;
  set noTaxableProfit(int noTaxableProfit) =>
      _$this._noTaxableProfit = noTaxableProfit;

  int _balanceAdjustment;
  int get balanceAdjustment => _$this._balanceAdjustment;
  set balanceAdjustment(int balanceAdjustment) =>
      _$this._balanceAdjustment = balanceAdjustment;

  int _capitalAllowance;
  int get capitalAllowance => _$this._capitalAllowance;
  set capitalAllowance(int capitalAllowance) =>
      _$this._capitalAllowance = capitalAllowance;

  int _paidCapital;
  int get paidCapital => _$this._paidCapital;
  set paidCapital(int paidCapital) => _$this._paidCapital = paidCapital;

  int _predictedTax;
  int get predictedTax => _$this._predictedTax;
  set predictedTax(int predictedTax) => _$this._predictedTax = predictedTax;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  Timestamp _currentDate;
  Timestamp get currentDate => _$this._currentDate;
  set currentDate(Timestamp currentDate) => _$this._currentDate = currentDate;

  TaxReturnModelBuiltBuilder();

  TaxReturnModelBuiltBuilder get _$this {
    if (_$v != null) {
      _grossProfit = _$v.grossProfit;
      _grossRevenue = _$v.grossRevenue;
      _generalAdminExpenses = _$v.generalAdminExpenses;
      _dissallowedExpenses = _$v.dissallowedExpenses;
      _noTaxableProfit = _$v.noTaxableProfit;
      _balanceAdjustment = _$v.balanceAdjustment;
      _capitalAllowance = _$v.capitalAllowance;
      _paidCapital = _$v.paidCapital;
      _predictedTax = _$v.predictedTax;
      _id = _$v.id;
      _currentDate = _$v.currentDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaxReturnModelBuilt other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TaxReturnModelBuilt;
  }

  @override
  void update(void Function(TaxReturnModelBuiltBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TaxReturnModelBuilt build() {
    final _$result = _$v ??
        new _$TaxReturnModelBuilt._(
            grossProfit: grossProfit,
            grossRevenue: grossRevenue,
            generalAdminExpenses: generalAdminExpenses,
            dissallowedExpenses: dissallowedExpenses,
            noTaxableProfit: noTaxableProfit,
            balanceAdjustment: balanceAdjustment,
            capitalAllowance: capitalAllowance,
            paidCapital: paidCapital,
            predictedTax: predictedTax,
            id: id,
            currentDate: currentDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
