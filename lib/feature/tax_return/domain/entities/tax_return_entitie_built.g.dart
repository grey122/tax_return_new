// GENERATED CODE - DO NOT MODIFY BY HAND

part of tax_return_entitie_built;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaxReturnBuilt extends TaxReturnBuilt {
  @override
  final String taxName;
  @override
  final String id;

  factory _$TaxReturnBuilt([void Function(TaxReturnBuiltBuilder) updates]) =>
      (new TaxReturnBuiltBuilder()..update(updates)).build();

  _$TaxReturnBuilt._({this.taxName, this.id}) : super._() {
    if (taxName == null) {
      throw new BuiltValueNullFieldError('TaxReturnBuilt', 'taxName');
    }
  }

  @override
  TaxReturnBuilt rebuild(void Function(TaxReturnBuiltBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaxReturnBuiltBuilder toBuilder() =>
      new TaxReturnBuiltBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaxReturnBuilt &&
        taxName == other.taxName &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, taxName.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaxReturnBuilt')
          ..add('taxName', taxName)
          ..add('id', id))
        .toString();
  }
}

class TaxReturnBuiltBuilder
    implements Builder<TaxReturnBuilt, TaxReturnBuiltBuilder> {
  _$TaxReturnBuilt _$v;

  String _taxName;
  String get taxName => _$this._taxName;
  set taxName(String taxName) => _$this._taxName = taxName;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  TaxReturnBuiltBuilder();

  TaxReturnBuiltBuilder get _$this {
    if (_$v != null) {
      _taxName = _$v.taxName;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaxReturnBuilt other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TaxReturnBuilt;
  }

  @override
  void update(void Function(TaxReturnBuiltBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TaxReturnBuilt build() {
    final _$result = _$v ?? new _$TaxReturnBuilt._(taxName: taxName, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
