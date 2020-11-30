// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_entity;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserEntity extends UserEntity {
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

  factory _$UserEntity([void Function(UserEntityBuilder) updates]) =>
      (new UserEntityBuilder()..update(updates)).build();

  _$UserEntity._(
      {this.id,
      this.userName,
      this.emailAddress,
      this.userContact,
      this.taxReturnType,
      this.companyCategory,
      this.isYearsOfOperation})
      : super._() {
    if (emailAddress == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'emailAddress');
    }
    if (userContact == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'userContact');
    }
    if (taxReturnType == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'taxReturnType');
    }
    if (companyCategory == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'companyCategory');
    }
    if (isYearsOfOperation == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'isYearsOfOperation');
    }
  }

  @override
  UserEntity rebuild(void Function(UserEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserEntityBuilder toBuilder() => new UserEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserEntity &&
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
    return (newBuiltValueToStringHelper('UserEntity')
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

class UserEntityBuilder implements Builder<UserEntity, UserEntityBuilder> {
  _$UserEntity _$v;

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

  UserEntityBuilder();

  UserEntityBuilder get _$this {
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
  void replace(UserEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserEntity;
  }

  @override
  void update(void Function(UserEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserEntity build() {
    final _$result = _$v ??
        new _$UserEntity._(
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
