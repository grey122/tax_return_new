// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserModel> _$userModelSerializer = new _$UserModelSerializer();

class _$UserModelSerializer implements StructuredSerializer<UserModel> {
  @override
  final Iterable<Type> types = const [UserModel, _$UserModel];
  @override
  final String wireName = 'UserModel';

  @override
  Iterable<Object> serialize(Serializers serializers, UserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'emailAddress',
      serializers.serialize(object.emailAddress,
          specifiedType: const FullType(String)),
      'userContact',
      serializers.serialize(object.userContact,
          specifiedType: const FullType(int)),
      'taxReturnType',
      serializers.serialize(object.taxReturnType,
          specifiedType: const FullType(String)),
      'companyCategory',
      serializers.serialize(object.companyCategory,
          specifiedType: const FullType(String)),
      'isYearsOfOperation',
      serializers.serialize(object.isYearsOfOperation,
          specifiedType: const FullType(bool)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.userName != null) {
      result
        ..add('userName')
        ..add(serializers.serialize(object.userName,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emailAddress':
          result.emailAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userContact':
          result.userContact = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'taxReturnType':
          result.taxReturnType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'companyCategory':
          result.companyCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isYearsOfOperation':
          result.isYearsOfOperation = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UserModel extends UserModel {
  @override
  final String id;
  @override
  final String userName;
  @override
  final String emailAddress;
  @override
  final int userContact;
  @override
  final String taxReturnType;
  @override
  final String companyCategory;
  @override
  final bool isYearsOfOperation;

  factory _$UserModel([void Function(UserModelBuilder) updates]) =>
      (new UserModelBuilder()..update(updates)).build();

  _$UserModel._(
      {this.id,
      this.userName,
      this.emailAddress,
      this.userContact,
      this.taxReturnType,
      this.companyCategory,
      this.isYearsOfOperation})
      : super._() {
    if (emailAddress == null) {
      throw new BuiltValueNullFieldError('UserModel', 'emailAddress');
    }
    if (userContact == null) {
      throw new BuiltValueNullFieldError('UserModel', 'userContact');
    }
    if (taxReturnType == null) {
      throw new BuiltValueNullFieldError('UserModel', 'taxReturnType');
    }
    if (companyCategory == null) {
      throw new BuiltValueNullFieldError('UserModel', 'companyCategory');
    }
    if (isYearsOfOperation == null) {
      throw new BuiltValueNullFieldError('UserModel', 'isYearsOfOperation');
    }
  }

  @override
  UserModel rebuild(void Function(UserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuilder toBuilder() => new UserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        id == other.id &&
        userName == other.userName &&
        emailAddress == other.emailAddress &&
        userContact == other.userContact &&
        taxReturnType == other.taxReturnType &&
        companyCategory == other.companyCategory &&
        isYearsOfOperation == other.isYearsOfOperation;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), userName.hashCode),
                        emailAddress.hashCode),
                    userContact.hashCode),
                taxReturnType.hashCode),
            companyCategory.hashCode),
        isYearsOfOperation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserModel')
          ..add('id', id)
          ..add('userName', userName)
          ..add('emailAddress', emailAddress)
          ..add('userContact', userContact)
          ..add('taxReturnType', taxReturnType)
          ..add('companyCategory', companyCategory)
          ..add('isYearsOfOperation', isYearsOfOperation))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _emailAddress;
  String get emailAddress => _$this._emailAddress;
  set emailAddress(String emailAddress) => _$this._emailAddress = emailAddress;

  int _userContact;
  int get userContact => _$this._userContact;
  set userContact(int userContact) => _$this._userContact = userContact;

  String _taxReturnType;
  String get taxReturnType => _$this._taxReturnType;
  set taxReturnType(String taxReturnType) =>
      _$this._taxReturnType = taxReturnType;

  String _companyCategory;
  String get companyCategory => _$this._companyCategory;
  set companyCategory(String companyCategory) =>
      _$this._companyCategory = companyCategory;

  bool _isYearsOfOperation;
  bool get isYearsOfOperation => _$this._isYearsOfOperation;
  set isYearsOfOperation(bool isYearsOfOperation) =>
      _$this._isYearsOfOperation = isYearsOfOperation;

  UserModelBuilder();

  UserModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userName = _$v.userName;
      _emailAddress = _$v.emailAddress;
      _userContact = _$v.userContact;
      _taxReturnType = _$v.taxReturnType;
      _companyCategory = _$v.companyCategory;
      _isYearsOfOperation = _$v.isYearsOfOperation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserModel;
  }

  @override
  void update(void Function(UserModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserModel build() {
    final _$result = _$v ??
        new _$UserModel._(
            id: id,
            userName: userName,
            emailAddress: emailAddress,
            userContact: userContact,
            taxReturnType: taxReturnType,
            companyCategory: companyCategory,
            isYearsOfOperation: isYearsOfOperation);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
