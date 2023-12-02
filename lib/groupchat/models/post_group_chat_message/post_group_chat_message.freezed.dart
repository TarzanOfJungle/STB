// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_group_chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostGroupChatMessage _$PostGroupChatMessageFromJson(Map<String, dynamic> json) {
  return _PostGroupChatMessage.fromJson(json);
}

/// @nodoc
mixin _$PostGroupChatMessage {
  int get shoppingId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostGroupChatMessageCopyWith<PostGroupChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostGroupChatMessageCopyWith<$Res> {
  factory $PostGroupChatMessageCopyWith(PostGroupChatMessage value,
          $Res Function(PostGroupChatMessage) then) =
      _$PostGroupChatMessageCopyWithImpl<$Res, PostGroupChatMessage>;
  @useResult
  $Res call({int shoppingId, String message});
}

/// @nodoc
class _$PostGroupChatMessageCopyWithImpl<$Res,
        $Val extends PostGroupChatMessage>
    implements $PostGroupChatMessageCopyWith<$Res> {
  _$PostGroupChatMessageCopyWithImpl(this._value, this._then);

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
abstract class _$$PostGroupChatMessageImplCopyWith<$Res>
    implements $PostGroupChatMessageCopyWith<$Res> {
  factory _$$PostGroupChatMessageImplCopyWith(_$PostGroupChatMessageImpl value,
          $Res Function(_$PostGroupChatMessageImpl) then) =
      __$$PostGroupChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, String message});
}

/// @nodoc
class __$$PostGroupChatMessageImplCopyWithImpl<$Res>
    extends _$PostGroupChatMessageCopyWithImpl<$Res, _$PostGroupChatMessageImpl>
    implements _$$PostGroupChatMessageImplCopyWith<$Res> {
  __$$PostGroupChatMessageImplCopyWithImpl(_$PostGroupChatMessageImpl _value,
      $Res Function(_$PostGroupChatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? message = null,
  }) {
    return _then(_$PostGroupChatMessageImpl(
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
class _$PostGroupChatMessageImpl extends _PostGroupChatMessage {
  const _$PostGroupChatMessageImpl(
      {required this.shoppingId, required this.message})
      : super._();

  factory _$PostGroupChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostGroupChatMessageImplFromJson(json);

  @override
  final int shoppingId;
  @override
  final String message;

  @override
  String toString() {
    return 'PostGroupChatMessage(shoppingId: $shoppingId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostGroupChatMessageImpl &&
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
  _$$PostGroupChatMessageImplCopyWith<_$PostGroupChatMessageImpl>
      get copyWith =>
          __$$PostGroupChatMessageImplCopyWithImpl<_$PostGroupChatMessageImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostGroupChatMessageImplToJson(
      this,
    );
  }
}

abstract class _PostGroupChatMessage extends PostGroupChatMessage {
  const factory _PostGroupChatMessage(
      {required final int shoppingId,
      required final String message}) = _$PostGroupChatMessageImpl;
  const _PostGroupChatMessage._() : super._();

  factory _PostGroupChatMessage.fromJson(Map<String, dynamic> json) =
      _$PostGroupChatMessageImpl.fromJson;

  @override
  int get shoppingId;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$PostGroupChatMessageImplCopyWith<_$PostGroupChatMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}
