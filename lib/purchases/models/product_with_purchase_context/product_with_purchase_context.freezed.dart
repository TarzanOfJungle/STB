// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_with_purchase_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductWithPurchaseContext _$ProductWithPurchaseContextFromJson(
    Map<String, dynamic> json) {
  return _ProductWithPurchaseContext.fromJson(json);
}

/// @nodoc
mixin _$ProductWithPurchaseContext {
  Product get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductWithPurchaseContextCopyWith<ProductWithPurchaseContext>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductWithPurchaseContextCopyWith<$Res> {
  factory $ProductWithPurchaseContextCopyWith(ProductWithPurchaseContext value,
          $Res Function(ProductWithPurchaseContext) then) =
      _$ProductWithPurchaseContextCopyWithImpl<$Res,
          ProductWithPurchaseContext>;
  @useResult
  $Res call({Product product, int quantity, double unitPrice});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductWithPurchaseContextCopyWithImpl<$Res,
        $Val extends ProductWithPurchaseContext>
    implements $ProductWithPurchaseContextCopyWith<$Res> {
  _$ProductWithPurchaseContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? unitPrice = null,
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
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$ProductWithPurchaseContextImplCopyWith<$Res>
    implements $ProductWithPurchaseContextCopyWith<$Res> {
  factory _$$ProductWithPurchaseContextImplCopyWith(
          _$ProductWithPurchaseContextImpl value,
          $Res Function(_$ProductWithPurchaseContextImpl) then) =
      __$$ProductWithPurchaseContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product, int quantity, double unitPrice});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductWithPurchaseContextImplCopyWithImpl<$Res>
    extends _$ProductWithPurchaseContextCopyWithImpl<$Res,
        _$ProductWithPurchaseContextImpl>
    implements _$$ProductWithPurchaseContextImplCopyWith<$Res> {
  __$$ProductWithPurchaseContextImplCopyWithImpl(
      _$ProductWithPurchaseContextImpl _value,
      $Res Function(_$ProductWithPurchaseContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_$ProductWithPurchaseContextImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductWithPurchaseContextImpl extends _ProductWithPurchaseContext {
  const _$ProductWithPurchaseContextImpl(
      {required this.product, required this.quantity, required this.unitPrice})
      : super._();

  factory _$ProductWithPurchaseContextImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProductWithPurchaseContextImplFromJson(json);

  @override
  final Product product;
  @override
  final int quantity;
  @override
  final double unitPrice;

  @override
  String toString() {
    return 'ProductWithPurchaseContext(product: $product, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductWithPurchaseContextImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity, unitPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductWithPurchaseContextImplCopyWith<_$ProductWithPurchaseContextImpl>
      get copyWith => __$$ProductWithPurchaseContextImplCopyWithImpl<
          _$ProductWithPurchaseContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductWithPurchaseContextImplToJson(
      this,
    );
  }
}

abstract class _ProductWithPurchaseContext extends ProductWithPurchaseContext {
  const factory _ProductWithPurchaseContext(
      {required final Product product,
      required final int quantity,
      required final double unitPrice}) = _$ProductWithPurchaseContextImpl;
  const _ProductWithPurchaseContext._() : super._();

  factory _ProductWithPurchaseContext.fromJson(Map<String, dynamic> json) =
      _$ProductWithPurchaseContextImpl.fromJson;

  @override
  Product get product;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  @JsonKey(ignore: true)
  _$$ProductWithPurchaseContextImplCopyWith<_$ProductWithPurchaseContextImpl>
      get copyWith => throw _privateConstructorUsedError;
}
