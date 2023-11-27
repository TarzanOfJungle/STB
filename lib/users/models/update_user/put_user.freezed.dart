// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'put_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PutUser _$PutUserFromJson(Map<String, dynamic> json) {
  return _PutUser.fromJson(json);
}

/// @nodoc
mixin _$PutUser {
  int get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PutUserCopyWith<PutUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PutUserCopyWith<$Res> {
  factory $PutUserCopyWith(PutUser value, $Res Function(PutUser) then) =
      _$PutUserCopyWithImpl<$Res, PutUser>;
  @useResult
  $Res call({int id, String? email, String? username, String? password});
}

/// @nodoc
class _$PutUserCopyWithImpl<$Res, $Val extends PutUser>
    implements $PutUserCopyWith<$Res> {
  _$PutUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PutUserImplCopyWith<$Res> implements $PutUserCopyWith<$Res> {
  factory _$$PutUserImplCopyWith(
          _$PutUserImpl value, $Res Function(_$PutUserImpl) then) =
      __$$PutUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? email, String? username, String? password});
}

/// @nodoc
class __$$PutUserImplCopyWithImpl<$Res>
    extends _$PutUserCopyWithImpl<$Res, _$PutUserImpl>
    implements _$$PutUserImplCopyWith<$Res> {
  __$$PutUserImplCopyWithImpl(
      _$PutUserImpl _value, $Res Function(_$PutUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$PutUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PutUserImpl extends _PutUser {
  const _$PutUserImpl(
      {required this.id, this.email, this.username, this.password})
      : super._();

  factory _$PutUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PutUserImplFromJson(json);

  @override
  final int id;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? password;

  @override
  String toString() {
    return 'PutUser(id: $id, email: $email, username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PutUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PutUserImplCopyWith<_$PutUserImpl> get copyWith =>
      __$$PutUserImplCopyWithImpl<_$PutUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PutUserImplToJson(
      this,
    );
  }
}

abstract class _PutUser extends PutUser {
  const factory _PutUser(
      {required final int id,
      final String? email,
      final String? username,
      final String? password}) = _$PutUserImpl;
  const _PutUser._() : super._();

  factory _PutUser.fromJson(Map<String, dynamic> json) = _$PutUserImpl.fromJson;

  @override
  int get id;
  @override
  String? get email;
  @override
  String? get username;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$PutUserImplCopyWith<_$PutUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
