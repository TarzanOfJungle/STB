// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_product_shopping_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostProductShoppingAssignment _$PostProductShoppingAssignmentFromJson(
    Map<String, dynamic> json) {
  return _PostProductShoppingAssignment.fromJson(json);
}

/// @nodoc
mixin _$PostProductShoppingAssignment {
  int get shoppingId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostProductShoppingAssignmentCopyWith<PostProductShoppingAssignment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostProductShoppingAssignmentCopyWith<$Res> {
  factory $PostProductShoppingAssignmentCopyWith(
          PostProductShoppingAssignment value,
          $Res Function(PostProductShoppingAssignment) then) =
      _$PostProductShoppingAssignmentCopyWithImpl<$Res,
          PostProductShoppingAssignment>;
  @useResult
  $Res call({int shoppingId, String productName, int quantity});
}

/// @nodoc
class _$PostProductShoppingAssignmentCopyWithImpl<$Res,
        $Val extends PostProductShoppingAssignment>
    implements $PostProductShoppingAssignmentCopyWith<$Res> {
  _$PostProductShoppingAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? productName = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostProductShoppingAssignmentImplCopyWith<$Res>
    implements $PostProductShoppingAssignmentCopyWith<$Res> {
  factory _$$PostProductShoppingAssignmentImplCopyWith(
          _$PostProductShoppingAssignmentImpl value,
          $Res Function(_$PostProductShoppingAssignmentImpl) then) =
      __$$PostProductShoppingAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, String productName, int quantity});
}

/// @nodoc
class __$$PostProductShoppingAssignmentImplCopyWithImpl<$Res>
    extends _$PostProductShoppingAssignmentCopyWithImpl<$Res,
        _$PostProductShoppingAssignmentImpl>
    implements _$$PostProductShoppingAssignmentImplCopyWith<$Res> {
  __$$PostProductShoppingAssignmentImplCopyWithImpl(
      _$PostProductShoppingAssignmentImpl _value,
      $Res Function(_$PostProductShoppingAssignmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? productName = null,
    Object? quantity = null,
  }) {
    return _then(_$PostProductShoppingAssignmentImpl(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostProductShoppingAssignmentImpl
    extends _PostProductShoppingAssignment {
  const _$PostProductShoppingAssignmentImpl(
      {required this.shoppingId,
      required this.productName,
      required this.quantity})
      : super._();

  factory _$PostProductShoppingAssignmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PostProductShoppingAssignmentImplFromJson(json);

  @override
  final int shoppingId;
  @override
  final String productName;
  @override
  final int quantity;

  @override
  String toString() {
    return 'PostProductShoppingAssignment(shoppingId: $shoppingId, productName: $productName, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostProductShoppingAssignmentImpl &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, shoppingId, productName, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostProductShoppingAssignmentImplCopyWith<
          _$PostProductShoppingAssignmentImpl>
      get copyWith => __$$PostProductShoppingAssignmentImplCopyWithImpl<
          _$PostProductShoppingAssignmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostProductShoppingAssignmentImplToJson(
      this,
    );
  }
}

abstract class _PostProductShoppingAssignment
    extends PostProductShoppingAssignment {
  const factory _PostProductShoppingAssignment(
      {required final int shoppingId,
      required final String productName,
      required final int quantity}) = _$PostProductShoppingAssignmentImpl;
  const _PostProductShoppingAssignment._() : super._();

  factory _PostProductShoppingAssignment.fromJson(Map<String, dynamic> json) =
      _$PostProductShoppingAssignmentImpl.fromJson;

  @override
  int get shoppingId;
  @override
  String get productName;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$PostProductShoppingAssignmentImplCopyWith<
          _$PostProductShoppingAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
