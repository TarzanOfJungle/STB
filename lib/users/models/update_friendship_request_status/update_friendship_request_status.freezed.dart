// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_friendship_request_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateFriendshipRequestStatus _$UpdateFriendshipRequestStatusFromJson(
    Map<String, dynamic> json) {
  return _UpdateFriendshipRequestStatus.fromJson(json);
}

/// @nodoc
mixin _$UpdateFriendshipRequestStatus {
  int get applicantId => throw _privateConstructorUsedError;
  int get acceptantId => throw _privateConstructorUsedError;
  bool get accept => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateFriendshipRequestStatusCopyWith<UpdateFriendshipRequestStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateFriendshipRequestStatusCopyWith<$Res> {
  factory $UpdateFriendshipRequestStatusCopyWith(
          UpdateFriendshipRequestStatus value,
          $Res Function(UpdateFriendshipRequestStatus) then) =
      _$UpdateFriendshipRequestStatusCopyWithImpl<$Res,
          UpdateFriendshipRequestStatus>;
  @useResult
  $Res call({int applicantId, int acceptantId, bool accept});
}

/// @nodoc
class _$UpdateFriendshipRequestStatusCopyWithImpl<$Res,
        $Val extends UpdateFriendshipRequestStatus>
    implements $UpdateFriendshipRequestStatusCopyWith<$Res> {
  _$UpdateFriendshipRequestStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicantId = null,
    Object? acceptantId = null,
    Object? accept = null,
  }) {
    return _then(_value.copyWith(
      applicantId: null == applicantId
          ? _value.applicantId
          : applicantId // ignore: cast_nullable_to_non_nullable
              as int,
      acceptantId: null == acceptantId
          ? _value.acceptantId
          : acceptantId // ignore: cast_nullable_to_non_nullable
              as int,
      accept: null == accept
          ? _value.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateFriendshipRequestStatusImplCopyWith<$Res>
    implements $UpdateFriendshipRequestStatusCopyWith<$Res> {
  factory _$$UpdateFriendshipRequestStatusImplCopyWith(
          _$UpdateFriendshipRequestStatusImpl value,
          $Res Function(_$UpdateFriendshipRequestStatusImpl) then) =
      __$$UpdateFriendshipRequestStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int applicantId, int acceptantId, bool accept});
}

/// @nodoc
class __$$UpdateFriendshipRequestStatusImplCopyWithImpl<$Res>
    extends _$UpdateFriendshipRequestStatusCopyWithImpl<$Res,
        _$UpdateFriendshipRequestStatusImpl>
    implements _$$UpdateFriendshipRequestStatusImplCopyWith<$Res> {
  __$$UpdateFriendshipRequestStatusImplCopyWithImpl(
      _$UpdateFriendshipRequestStatusImpl _value,
      $Res Function(_$UpdateFriendshipRequestStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicantId = null,
    Object? acceptantId = null,
    Object? accept = null,
  }) {
    return _then(_$UpdateFriendshipRequestStatusImpl(
      applicantId: null == applicantId
          ? _value.applicantId
          : applicantId // ignore: cast_nullable_to_non_nullable
              as int,
      acceptantId: null == acceptantId
          ? _value.acceptantId
          : acceptantId // ignore: cast_nullable_to_non_nullable
              as int,
      accept: null == accept
          ? _value.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateFriendshipRequestStatusImpl
    extends _UpdateFriendshipRequestStatus {
  const _$UpdateFriendshipRequestStatusImpl(
      {required this.applicantId,
      required this.acceptantId,
      required this.accept})
      : super._();

  factory _$UpdateFriendshipRequestStatusImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateFriendshipRequestStatusImplFromJson(json);

  @override
  final int applicantId;
  @override
  final int acceptantId;
  @override
  final bool accept;

  @override
  String toString() {
    return 'UpdateFriendshipRequestStatus(applicantId: $applicantId, acceptantId: $acceptantId, accept: $accept)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFriendshipRequestStatusImpl &&
            (identical(other.applicantId, applicantId) ||
                other.applicantId == applicantId) &&
            (identical(other.acceptantId, acceptantId) ||
                other.acceptantId == acceptantId) &&
            (identical(other.accept, accept) || other.accept == accept));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, applicantId, acceptantId, accept);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFriendshipRequestStatusImplCopyWith<
          _$UpdateFriendshipRequestStatusImpl>
      get copyWith => __$$UpdateFriendshipRequestStatusImplCopyWithImpl<
          _$UpdateFriendshipRequestStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateFriendshipRequestStatusImplToJson(
      this,
    );
  }
}

abstract class _UpdateFriendshipRequestStatus
    extends UpdateFriendshipRequestStatus {
  const factory _UpdateFriendshipRequestStatus(
      {required final int applicantId,
      required final int acceptantId,
      required final bool accept}) = _$UpdateFriendshipRequestStatusImpl;
  const _UpdateFriendshipRequestStatus._() : super._();

  factory _UpdateFriendshipRequestStatus.fromJson(Map<String, dynamic> json) =
      _$UpdateFriendshipRequestStatusImpl.fromJson;

  @override
  int get applicantId;
  @override
  int get acceptantId;
  @override
  bool get accept;
  @override
  @JsonKey(ignore: true)
  _$$UpdateFriendshipRequestStatusImplCopyWith<
          _$UpdateFriendshipRequestStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
