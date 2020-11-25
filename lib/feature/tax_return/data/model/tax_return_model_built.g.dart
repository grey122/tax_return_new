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
      'taxName',
      serializers.serialize(object.taxName,
          specifiedType: const FullType(String)),
    ];
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
        case 'taxName':
          result.taxName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TaxReturnModelBuilt extends TaxReturnModelBuilt {
  @override
  final String taxName;
  @override
  final String id;

  factory _$TaxReturnModelBuilt(
          [void Function(TaxReturnModelBuiltBuilder) updates]) =>
      (new TaxReturnModelBuiltBuilder()..update(updates)).build();

  _$TaxReturnModelBuilt._({this.taxName, this.id}) : super._() {
    if (taxName == null) {
      throw new BuiltValueNullFieldError('TaxReturnModelBuilt', 'taxName');
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
        taxName == other.taxName &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, taxName.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaxReturnModelBuilt')
          ..add('taxName', taxName)
          ..add('id', id))
        .toString();
  }
}

class TaxReturnModelBuiltBuilder
    implements Builder<TaxReturnModelBuilt, TaxReturnModelBuiltBuilder> {
  _$TaxReturnModelBuilt _$v;

  String _taxName;
  String get taxName => _$this._taxName;
  set taxName(String taxName) => _$this._taxName = taxName;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  TaxReturnModelBuiltBuilder();

  TaxReturnModelBuiltBuilder get _$this {
    if (_$v != null) {
      _taxName = _$v.taxName;
      _id = _$v.id;
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
    final _$result =
        _$v ?? new _$TaxReturnModelBuilt._(taxName: taxName, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
