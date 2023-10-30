// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticated_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticatedUser _$AuthenticatedUserFromJson(Map<String, dynamic> json) {
  return _AuthenticatedUser.fromJson(json);
}

/// @nodoc
mixin _$AuthenticatedUser {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  DateTime? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticatedUserCopyWith<AuthenticatedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatedUserCopyWith<$Res> {
  factory $AuthenticatedUserCopyWith(
          AuthenticatedUser value, $Res Function(AuthenticatedUser) then) =
      _$AuthenticatedUserCopyWithImpl<$Res, AuthenticatedUser>;
  @useResult
  $Res call(
      {int id,
      String email,
      String username,
      String token,
      DateTime? created,
      DateTime? updated});
}

/// @nodoc
class _$AuthenticatedUserCopyWithImpl<$Res, $Val extends AuthenticatedUser>
    implements $AuthenticatedUserCopyWith<$Res> {
  _$AuthenticatedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? token = null,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticatedUserImplCopyWith<$Res>
    implements $AuthenticatedUserCopyWith<$Res> {
  factory _$$AuthenticatedUserImplCopyWith(_$AuthenticatedUserImpl value,
          $Res Function(_$AuthenticatedUserImpl) then) =
      __$$AuthenticatedUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String username,
      String token,
      DateTime? created,
      DateTime? updated});
}

/// @nodoc
class __$$AuthenticatedUserImplCopyWithImpl<$Res>
    extends _$AuthenticatedUserCopyWithImpl<$Res, _$AuthenticatedUserImpl>
    implements _$$AuthenticatedUserImplCopyWith<$Res> {
  __$$AuthenticatedUserImplCopyWithImpl(_$AuthenticatedUserImpl _value,
      $Res Function(_$AuthenticatedUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? token = null,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_$AuthenticatedUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticatedUserImpl extends _AuthenticatedUser {
  const _$AuthenticatedUserImpl(
      {required this.id,
      required this.email,
      required this.username,
      required this.token,
      this.created,
      this.updated})
      : super._();

  factory _$AuthenticatedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticatedUserImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String username;
  @override
  final String token;
  @override
  final DateTime? created;
  @override
  final DateTime? updated;

  @override
  String toString() {
    return 'AuthenticatedUser(id: $id, email: $email, username: $username, token: $token, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, username, token, created, updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedUserImplCopyWith<_$AuthenticatedUserImpl> get copyWith =>
      __$$AuthenticatedUserImplCopyWithImpl<_$AuthenticatedUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticatedUserImplToJson(
      this,
    );
  }
}

abstract class _AuthenticatedUser extends AuthenticatedUser {
  const factory _AuthenticatedUser(
      {required final int id,
      required final String email,
      required final String username,
      required final String token,
      final DateTime? created,
      final DateTime? updated}) = _$AuthenticatedUserImpl;
  const _AuthenticatedUser._() : super._();

  factory _AuthenticatedUser.fromJson(Map<String, dynamic> json) =
      _$AuthenticatedUserImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get username;
  @override
  String get token;
  @override
  DateTime? get created;
  @override
  DateTime? get updated;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticatedUserImplCopyWith<_$AuthenticatedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}