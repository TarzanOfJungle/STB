// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_groupchat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostGroupchatMessage _$PostGroupchatMessageFromJson(Map<String, dynamic> json) {
  return _PostGroupchatMessage.fromJson(json);
}

/// @nodoc
mixin _$PostGroupchatMessage {
  int get shoppingId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostGroupchatMessageCopyWith<PostGroupchatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostGroupchatMessageCopyWith<$Res> {
  factory $PostGroupchatMessageCopyWith(PostGroupchatMessage value,
          $Res Function(PostGroupchatMessage) then) =
      _$PostGroupchatMessageCopyWithImpl<$Res, PostGroupchatMessage>;
  @useResult
  $Res call({int shoppingId, String message});
}

/// @nodoc
class _$PostGroupchatMessageCopyWithImpl<$Res,
        $Val extends PostGroupchatMessage>
    implements $PostGroupchatMessageCopyWith<$Res> {
  _$PostGroupchatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostGroupchatMessageImplCopyWith<$Res>
    implements $PostGroupchatMessageCopyWith<$Res> {
  factory _$$PostGroupchatMessageImplCopyWith(_$PostGroupchatMessageImpl value,
          $Res Function(_$PostGroupchatMessageImpl) then) =
      __$$PostGroupchatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, String message});
}

/// @nodoc
class __$$PostGroupchatMessageImplCopyWithImpl<$Res>
    extends _$PostGroupchatMessageCopyWithImpl<$Res, _$PostGroupchatMessageImpl>
    implements _$$PostGroupchatMessageImplCopyWith<$Res> {
  __$$PostGroupchatMessageImplCopyWithImpl(_$PostGroupchatMessageImpl _value,
      $Res Function(_$PostGroupchatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? message = null,
  }) {
    return _then(_$PostGroupchatMessageImpl(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostGroupchatMessageImpl extends _PostGroupchatMessage {
  const _$PostGroupchatMessageImpl(
      {required this.shoppingId, required this.message})
      : super._();

  factory _$PostGroupchatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostGroupchatMessageImplFromJson(json);

  @override
  final int shoppingId;
  @override
  final String message;

  @override
  String toString() {
    return 'PostGroupchatMessage(shoppingId: $shoppingId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostGroupchatMessageImpl &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shoppingId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostGroupchatMessageImplCopyWith<_$PostGroupchatMessageImpl>
      get copyWith =>
          __$$PostGroupchatMessageImplCopyWithImpl<_$PostGroupchatMessageImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostGroupchatMessageImplToJson(
      this,
    );
  }
}

abstract class _PostGroupchatMessage extends PostGroupchatMessage {
  const factory _PostGroupchatMessage(
      {required final int shoppingId,
      required final String message}) = _$PostGroupchatMessageImpl;
  const _PostGroupchatMessage._() : super._();

  factory _PostGroupchatMessage.fromJson(Map<String, dynamic> json) =
      _$PostGroupchatMessageImpl.fromJson;

  @override
  int get shoppingId;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$PostGroupchatMessageImplCopyWith<_$PostGroupchatMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}
