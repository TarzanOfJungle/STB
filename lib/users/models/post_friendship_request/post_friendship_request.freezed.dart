// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_friendship_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostFriendshipRequest _$PostFriendshipRequestFromJson(
    Map<String, dynamic> json) {
  return _PostFriendshipRequest.fromJson(json);
}

/// @nodoc
mixin _$PostFriendshipRequest {
  int get applicantId => throw _privateConstructorUsedError;
  int get acceptantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostFriendshipRequestCopyWith<PostFriendshipRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFriendshipRequestCopyWith<$Res> {
  factory $PostFriendshipRequestCopyWith(PostFriendshipRequest value,
          $Res Function(PostFriendshipRequest) then) =
      _$PostFriendshipRequestCopyWithImpl<$Res, PostFriendshipRequest>;
  @useResult
  $Res call({int applicantId, int acceptantId});
}

/// @nodoc
class _$PostFriendshipRequestCopyWithImpl<$Res,
        $Val extends PostFriendshipRequest>
    implements $PostFriendshipRequestCopyWith<$Res> {
  _$PostFriendshipRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicantId = null,
    Object? acceptantId = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostFriendshipRequestImplCopyWith<$Res>
    implements $PostFriendshipRequestCopyWith<$Res> {
  factory _$$PostFriendshipRequestImplCopyWith(
          _$PostFriendshipRequestImpl value,
          $Res Function(_$PostFriendshipRequestImpl) then) =
      __$$PostFriendshipRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int applicantId, int acceptantId});
}

/// @nodoc
class __$$PostFriendshipRequestImplCopyWithImpl<$Res>
    extends _$PostFriendshipRequestCopyWithImpl<$Res,
        _$PostFriendshipRequestImpl>
    implements _$$PostFriendshipRequestImplCopyWith<$Res> {
  __$$PostFriendshipRequestImplCopyWithImpl(_$PostFriendshipRequestImpl _value,
      $Res Function(_$PostFriendshipRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicantId = null,
    Object? acceptantId = null,
  }) {
    return _then(_$PostFriendshipRequestImpl(
      applicantId: null == applicantId
          ? _value.applicantId
          : applicantId // ignore: cast_nullable_to_non_nullable
              as int,
      acceptantId: null == acceptantId
          ? _value.acceptantId
          : acceptantId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostFriendshipRequestImpl extends _PostFriendshipRequest {
  const _$PostFriendshipRequestImpl(
      {required this.applicantId, required this.acceptantId})
      : super._();

  factory _$PostFriendshipRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostFriendshipRequestImplFromJson(json);

  @override
  final int applicantId;
  @override
  final int acceptantId;

  @override
  String toString() {
    return 'PostFriendshipRequest(applicantId: $applicantId, acceptantId: $acceptantId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFriendshipRequestImpl &&
            (identical(other.applicantId, applicantId) ||
                other.applicantId == applicantId) &&
            (identical(other.acceptantId, acceptantId) ||
                other.acceptantId == acceptantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, applicantId, acceptantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFriendshipRequestImplCopyWith<_$PostFriendshipRequestImpl>
      get copyWith => __$$PostFriendshipRequestImplCopyWithImpl<
          _$PostFriendshipRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostFriendshipRequestImplToJson(
      this,
    );
  }
}

abstract class _PostFriendshipRequest extends PostFriendshipRequest {
  const factory _PostFriendshipRequest(
      {required final int applicantId,
      required final int acceptantId}) = _$PostFriendshipRequestImpl;
  const _PostFriendshipRequest._() : super._();

  factory _PostFriendshipRequest.fromJson(Map<String, dynamic> json) =
      _$PostFriendshipRequestImpl.fromJson;

  @override
  int get applicantId;
  @override
  int get acceptantId;
  @override
  @JsonKey(ignore: true)
  _$$PostFriendshipRequestImplCopyWith<_$PostFriendshipRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
