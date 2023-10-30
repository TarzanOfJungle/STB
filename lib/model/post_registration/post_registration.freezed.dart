// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostRegistration _$PostRegistrationFromJson(Map<String, dynamic> json) {
  return _PostRegistration.fromJson(json);
}

/// @nodoc
mixin _$PostRegistration {
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostRegistrationCopyWith<PostRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostRegistrationCopyWith<$Res> {
  factory $PostRegistrationCopyWith(
          PostRegistration value, $Res Function(PostRegistration) then) =
      _$PostRegistrationCopyWithImpl<$Res, PostRegistration>;
  @useResult
  $Res call({String email, String username, String password});
}

/// @nodoc
class _$PostRegistrationCopyWithImpl<$Res, $Val extends PostRegistration>
    implements $PostRegistrationCopyWith<$Res> {
  _$PostRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostRegistrationImplCopyWith<$Res>
    implements $PostRegistrationCopyWith<$Res> {
  factory _$$PostRegistrationImplCopyWith(_$PostRegistrationImpl value,
          $Res Function(_$PostRegistrationImpl) then) =
      __$$PostRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String username, String password});
}

/// @nodoc
class __$$PostRegistrationImplCopyWithImpl<$Res>
    extends _$PostRegistrationCopyWithImpl<$Res, _$PostRegistrationImpl>
    implements _$$PostRegistrationImplCopyWith<$Res> {
  __$$PostRegistrationImplCopyWithImpl(_$PostRegistrationImpl _value,
      $Res Function(_$PostRegistrationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$PostRegistrationImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostRegistrationImpl extends _PostRegistration {
  const _$PostRegistrationImpl(
      {required this.email, required this.username, required this.password})
      : super._();

  factory _$PostRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostRegistrationImplFromJson(json);

  @override
  final String email;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'PostRegistration(email: $email, username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostRegistrationImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostRegistrationImplCopyWith<_$PostRegistrationImpl> get copyWith =>
      __$$PostRegistrationImplCopyWithImpl<_$PostRegistrationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostRegistrationImplToJson(
      this,
    );
  }
}

abstract class _PostRegistration extends PostRegistration {
  const factory _PostRegistration(
      {required final String email,
      required final String username,
      required final String password}) = _$PostRegistrationImpl;
  const _PostRegistration._() : super._();

  factory _PostRegistration.fromJson(Map<String, dynamic> json) =
      _$PostRegistrationImpl.fromJson;

  @override
  String get email;
  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$PostRegistrationImplCopyWith<_$PostRegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
