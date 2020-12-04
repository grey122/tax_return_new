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
  final String userContact;
  @override
  final String taxReturnType;
  @override
  final BuiltMap<String, Object> cityPage;

  factory _$UserEntity([void Function(UserEntityBuilder) updates]) =>
      (new UserEntityBuilder()..update(updates)).build();

  _$UserEntity._(
      {this.id,
      this.userName,
      this.emailAddress,
      this.userContact,
      this.taxReturnType,
      this.cityPage})
      : super._() {
    if (userName == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'userName');
    }
    if (emailAddress == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'emailAddress');
    }
    if (userContact == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'userContact');
    }
    if (taxReturnType == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'taxReturnType');
    }
    if (cityPage == null) {
      throw new BuiltValueNullFieldError('UserEntity', 'cityPage');
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
        cityPage == other.cityPage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), userName.hashCode),
                    emailAddress.hashCode),
                userContact.hashCode),
            taxReturnType.hashCode),
        cityPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserEntity')
          ..add('id', id)
          ..add('userName', userName)
          ..add('emailAddress', emailAddress)
          ..add('userContact', userContact)
          ..add('taxReturnType', taxReturnType)
          ..add('cityPage', cityPage))
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

  String _userContact;
  String get userContact => _$this._userContact;
  set userContact(String userContact) => _$this._userContact = userContact;

  String _taxReturnType;
  String get taxReturnType => _$this._taxReturnType;
  set taxReturnType(String taxReturnType) =>
      _$this._taxReturnType = taxReturnType;

  MapBuilder<String, Object> _cityPage;
  MapBuilder<String, Object> get cityPage =>
      _$this._cityPage ??= new MapBuilder<String, Object>();
  set cityPage(MapBuilder<String, Object> cityPage) =>
      _$this._cityPage = cityPage;

  UserEntityBuilder();

  UserEntityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userName = _$v.userName;
      _emailAddress = _$v.emailAddress;
      _userContact = _$v.userContact;
      _taxReturnType = _$v.taxReturnType;
      _cityPage = _$v.cityPage?.toBuilder();
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
    _$UserEntity _$result;
    try {
      _$result = _$v ??
          new _$UserEntity._(
              id: id,
              userName: userName,
              emailAddress: emailAddress,
              userContact: userContact,
              taxReturnType: taxReturnType,
              cityPage: cityPage.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'cityPage';
        cityPage.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
