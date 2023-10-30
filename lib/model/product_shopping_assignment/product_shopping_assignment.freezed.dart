// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_shopping_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductShoppingAssignment _$ProductShoppingAssignmentFromJson(
    Map<String, dynamic> json) {
  return _ProductShoppingAssignment.fromJson(json);
}

/// @nodoc
mixin _$ProductShoppingAssignment {
  Product get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductShoppingAssignmentCopyWith<ProductShoppingAssignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductShoppingAssignmentCopyWith<$Res> {
  factory $ProductShoppingAssignmentCopyWith(ProductShoppingAssignment value,
          $Res Function(ProductShoppingAssignment) then) =
      _$ProductShoppingAssignmentCopyWithImpl<$Res, ProductShoppingAssignment>;
  @useResult
  $Res call({Product product, int quantity});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductShoppingAssignmentCopyWithImpl<$Res,
        $Val extends ProductShoppingAssignment>
    implements $ProductShoppingAssignmentCopyWith<$Res> {
  _$ProductShoppingAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductShoppingAssignmentImplCopyWith<$Res>
    implements $ProductShoppingAssignmentCopyWith<$Res> {
  factory _$$ProductShoppingAssignmentImplCopyWith(
          _$ProductShoppingAssignmentImpl value,
          $Res Function(_$ProductShoppingAssignmentImpl) then) =
      __$$ProductShoppingAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product, int quantity});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductShoppingAssignmentImplCopyWithImpl<$Res>
    extends _$ProductShoppingAssignmentCopyWithImpl<$Res,
        _$ProductShoppingAssignmentImpl>
    implements _$$ProductShoppingAssignmentImplCopyWith<$Res> {
  __$$ProductShoppingAssignmentImplCopyWithImpl(
      _$ProductShoppingAssignmentImpl _value,
      $Res Function(_$ProductShoppingAssignmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$ProductShoppingAssignmentImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductShoppingAssignmentImpl extends _ProductShoppingAssignment {
  const _$ProductShoppingAssignmentImpl(
      {required this.product, required this.quantity})
      : super._();

  factory _$ProductShoppingAssignmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductShoppingAssignmentImplFromJson(json);

  @override
  final Product product;
  @override
  final int quantity;

  @override
  String toString() {
    return 'ProductShoppingAssignment(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductShoppingAssignmentImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductShoppingAssignmentImplCopyWith<_$ProductShoppingAssignmentImpl>
      get copyWith => __$$ProductShoppingAssignmentImplCopyWithImpl<
          _$ProductShoppingAssignmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductShoppingAssignmentImplToJson(
      this,
    );
  }
}

abstract class _ProductShoppingAssignment extends ProductShoppingAssignment {
  const factory _ProductShoppingAssignment(
      {required final Product product,
      required final int quantity}) = _$ProductShoppingAssignmentImpl;
  const _ProductShoppingAssignment._() : super._();

  factory _ProductShoppingAssignment.fromJson(Map<String, dynamic> json) =
      _$ProductShoppingAssignmentImpl.fromJson;

  @override
  Product get product;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ProductShoppingAssignmentImplCopyWith<_$ProductShoppingAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
