// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostProduct _$PostProductFromJson(Map<String, dynamic> json) {
  return _PostProduct.fromJson(json);
}

/// @nodoc
mixin _$PostProduct {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostProductCopyWith<PostProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostProductCopyWith<$Res> {
  factory $PostProductCopyWith(
          PostProduct value, $Res Function(PostProduct) then) =
      _$PostProductCopyWithImpl<$Res, PostProduct>;
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class _$PostProductCopyWithImpl<$Res, $Val extends PostProduct>
    implements $PostProductCopyWith<$Res> {
  _$PostProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostProductImplCopyWith<$Res>
    implements $PostProductCopyWith<$Res> {
  factory _$$PostProductImplCopyWith(
          _$PostProductImpl value, $Res Function(_$PostProductImpl) then) =
      __$$PostProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class __$$PostProductImplCopyWithImpl<$Res>
    extends _$PostProductCopyWithImpl<$Res, _$PostProductImpl>
    implements _$$PostProductImplCopyWith<$Res> {
  __$$PostProductImplCopyWithImpl(
      _$PostProductImpl _value, $Res Function(_$PostProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$PostProductImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostProductImpl extends _PostProduct {
  const _$PostProductImpl({required this.name, required this.description})
      : super._();

  factory _$PostProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostProductImplFromJson(json);

  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'PostProduct(name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostProductImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostProductImplCopyWith<_$PostProductImpl> get copyWith =>
      __$$PostProductImplCopyWithImpl<_$PostProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostProductImplToJson(
      this,
    );
  }
}

abstract class _PostProduct extends PostProduct {
  const factory _PostProduct(
      {required final String name,
      required final String description}) = _$PostProductImpl;
  const _PostProduct._() : super._();

  factory _PostProduct.fromJson(Map<String, dynamic> json) =
      _$PostProductImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$PostProductImplCopyWith<_$PostProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
