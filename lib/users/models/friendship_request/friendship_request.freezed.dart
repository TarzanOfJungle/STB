// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friendship_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendshipRequest _$FriendshipRequestFromJson(Map<String, dynamic> json) {
  return _FriendshipRequest.fromJson(json);
}

/// @nodoc
mixin _$FriendshipRequest {
  User get applicant => throw _privateConstructorUsedError;
  User get acceptant => throw _privateConstructorUsedError;
  FriendshipRequestStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendshipRequestCopyWith<FriendshipRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendshipRequestCopyWith<$Res> {
  factory $FriendshipRequestCopyWith(
          FriendshipRequest value, $Res Function(FriendshipRequest) then) =
      _$FriendshipRequestCopyWithImpl<$Res, FriendshipRequest>;
  @useResult
  $Res call({User applicant, User acceptant, FriendshipRequestStatus status});

  $UserCopyWith<$Res> get applicant;
  $UserCopyWith<$Res> get acceptant;
}

/// @nodoc
class _$FriendshipRequestCopyWithImpl<$Res, $Val extends FriendshipRequest>
    implements $FriendshipRequestCopyWith<$Res> {
  _$FriendshipRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicant = null,
    Object? acceptant = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      applicant: null == applicant
          ? _value.applicant
          : applicant // ignore: cast_nullable_to_non_nullable
              as User,
      acceptant: null == acceptant
          ? _value.acceptant
          : acceptant // ignore: cast_nullable_to_non_nullable
              as User,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FriendshipRequestStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get applicant {
    return $UserCopyWith<$Res>(_value.applicant, (value) {
      return _then(_value.copyWith(applicant: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get acceptant {
    return $UserCopyWith<$Res>(_value.acceptant, (value) {
      return _then(_value.copyWith(acceptant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FriendshipRequestImplCopyWith<$Res>
    implements $FriendshipRequestCopyWith<$Res> {
  factory _$$FriendshipRequestImplCopyWith(_$FriendshipRequestImpl value,
          $Res Function(_$FriendshipRequestImpl) then) =
      __$$FriendshipRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User applicant, User acceptant, FriendshipRequestStatus status});

  @override
  $UserCopyWith<$Res> get applicant;
  @override
  $UserCopyWith<$Res> get acceptant;
}

/// @nodoc
class __$$FriendshipRequestImplCopyWithImpl<$Res>
    extends _$FriendshipRequestCopyWithImpl<$Res, _$FriendshipRequestImpl>
    implements _$$FriendshipRequestImplCopyWith<$Res> {
  __$$FriendshipRequestImplCopyWithImpl(_$FriendshipRequestImpl _value,
      $Res Function(_$FriendshipRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicant = null,
    Object? acceptant = null,
    Object? status = null,
  }) {
    return _then(_$FriendshipRequestImpl(
      applicant: null == applicant
          ? _value.applicant
          : applicant // ignore: cast_nullable_to_non_nullable
              as User,
      acceptant: null == acceptant
          ? _value.acceptant
          : acceptant // ignore: cast_nullable_to_non_nullable
              as User,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FriendshipRequestStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendshipRequestImpl extends _FriendshipRequest {
  const _$FriendshipRequestImpl(
      {required this.applicant, required this.acceptant, required this.status})
      : super._();

  factory _$FriendshipRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendshipRequestImplFromJson(json);

  @override
  final User applicant;
  @override
  final User acceptant;
  @override
  final FriendshipRequestStatus status;

  @override
  String toString() {
    return 'FriendshipRequest(applicant: $applicant, acceptant: $acceptant, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendshipRequestImpl &&
            (identical(other.applicant, applicant) ||
                other.applicant == applicant) &&
            (identical(other.acceptant, acceptant) ||
                other.acceptant == acceptant) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, applicant, acceptant, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendshipRequestImplCopyWith<_$FriendshipRequestImpl> get copyWith =>
      __$$FriendshipRequestImplCopyWithImpl<_$FriendshipRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendshipRequestImplToJson(
      this,
    );
  }
}

abstract class _FriendshipRequest extends FriendshipRequest {
  const factory _FriendshipRequest(
      {required final User applicant,
      required final User acceptant,
      required final FriendshipRequestStatus status}) = _$FriendshipRequestImpl;
  const _FriendshipRequest._() : super._();

  factory _FriendshipRequest.fromJson(Map<String, dynamic> json) =
      _$FriendshipRequestImpl.fromJson;

  @override
  User get applicant;
  @override
  User get acceptant;
  @override
  FriendshipRequestStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$FriendshipRequestImplCopyWith<_$FriendshipRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
