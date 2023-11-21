// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_shopping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostShopping _$PostShoppingFromJson(Map<String, dynamic> json) {
  return _PostShopping.fromJson(json);
}

/// @nodoc
mixin _$PostShopping {
  String get name => throw _privateConstructorUsedError;
  DateTime? get dueDateTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostShoppingCopyWith<PostShopping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostShoppingCopyWith<$Res> {
  factory $PostShoppingCopyWith(
          PostShopping value, $Res Function(PostShopping) then) =
      _$PostShoppingCopyWithImpl<$Res, PostShopping>;
  @useResult
  $Res call({String name, DateTime? dueDateTime, String? description});
}

/// @nodoc
class _$PostShoppingCopyWithImpl<$Res, $Val extends PostShopping>
    implements $PostShoppingCopyWith<$Res> {
  _$PostShoppingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dueDateTime = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dueDateTime: freezed == dueDateTime
          ? _value.dueDateTime
          : dueDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostShoppingImplCopyWith<$Res>
    implements $PostShoppingCopyWith<$Res> {
  factory _$$PostShoppingImplCopyWith(
          _$PostShoppingImpl value, $Res Function(_$PostShoppingImpl) then) =
      __$$PostShoppingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, DateTime? dueDateTime, String? description});
}

/// @nodoc
class __$$PostShoppingImplCopyWithImpl<$Res>
    extends _$PostShoppingCopyWithImpl<$Res, _$PostShoppingImpl>
    implements _$$PostShoppingImplCopyWith<$Res> {
  __$$PostShoppingImplCopyWithImpl(
      _$PostShoppingImpl _value, $Res Function(_$PostShoppingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dueDateTime = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PostShoppingImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dueDateTime: freezed == dueDateTime
          ? _value.dueDateTime
          : dueDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostShoppingImpl extends _PostShopping {
  const _$PostShoppingImpl(
      {required this.name, this.dueDateTime, this.description})
      : super._();

  factory _$PostShoppingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostShoppingImplFromJson(json);

  @override
  final String name;
  @override
  final DateTime? dueDateTime;
  @override
  final String? description;

  @override
  String toString() {
    return 'PostShopping(name: $name, dueDateTime: $dueDateTime, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostShoppingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dueDateTime, dueDateTime) ||
                other.dueDateTime == dueDateTime) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, dueDateTime, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostShoppingImplCopyWith<_$PostShoppingImpl> get copyWith =>
      __$$PostShoppingImplCopyWithImpl<_$PostShoppingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostShoppingImplToJson(
      this,
    );
  }
}

abstract class _PostShopping extends PostShopping {
  const factory _PostShopping(
      {required final String name,
      final DateTime? dueDateTime,
      final String? description}) = _$PostShoppingImpl;
  const _PostShopping._() : super._();

  factory _PostShopping.fromJson(Map<String, dynamic> json) =
      _$PostShoppingImpl.fromJson;

  @override
  String get name;
  @override
  DateTime? get dueDateTime;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$PostShoppingImplCopyWith<_$PostShoppingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
