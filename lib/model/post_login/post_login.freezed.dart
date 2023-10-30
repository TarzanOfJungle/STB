// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostLogin _$PostLoginFromJson(Map<String, dynamic> json) {
  return _PostLogin.fromJson(json);
}

/// @nodoc
mixin _$PostLogin {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostLoginCopyWith<PostLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLoginCopyWith<$Res> {
  factory $PostLoginCopyWith(PostLogin value, $Res Function(PostLogin) then) =
      _$PostLoginCopyWithImpl<$Res, PostLogin>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$PostLoginCopyWithImpl<$Res, $Val extends PostLogin>
    implements $PostLoginCopyWith<$Res> {
  _$PostLoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostLoginImplCopyWith<$Res>
    implements $PostLoginCopyWith<$Res> {
  factory _$$PostLoginImplCopyWith(
          _$PostLoginImpl value, $Res Function(_$PostLoginImpl) then) =
      __$$PostLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$PostLoginImplCopyWithImpl<$Res>
    extends _$PostLoginCopyWithImpl<$Res, _$PostLoginImpl>
    implements _$$PostLoginImplCopyWith<$Res> {
  __$$PostLoginImplCopyWithImpl(
      _$PostLoginImpl _value, $Res Function(_$PostLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$PostLoginImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$PostLoginImpl extends _PostLogin {
  const _$PostLoginImpl({required this.email, required this.password})
      : super._();

  factory _$PostLoginImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostLoginImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'PostLogin(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostLoginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostLoginImplCopyWith<_$PostLoginImpl> get copyWith =>
      __$$PostLoginImplCopyWithImpl<_$PostLoginImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostLoginImplToJson(
      this,
    );
  }
}

abstract class _PostLogin extends PostLogin {
  const factory _PostLogin(
      {required final String email,
      required final String password}) = _$PostLoginImpl;
  const _PostLogin._() : super._();

  factory _PostLogin.fromJson(Map<String, dynamic> json) =
      _$PostLoginImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$PostLoginImplCopyWith<_$PostLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
