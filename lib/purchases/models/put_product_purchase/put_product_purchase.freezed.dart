// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'put_product_purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PutProductPurchase _$PutProductPurchaseFromJson(Map<String, dynamic> json) {
  return _PutProductPurchase.fromJson(json);
}

/// @nodoc
mixin _$PutProductPurchase {
  int get shoppingId => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PutProductPurchaseCopyWith<PutProductPurchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PutProductPurchaseCopyWith<$Res> {
  factory $PutProductPurchaseCopyWith(
          PutProductPurchase value, $Res Function(PutProductPurchase) then) =
      _$PutProductPurchaseCopyWithImpl<$Res, PutProductPurchase>;
  @useResult
  $Res call({int shoppingId, int productId, int quantity, double unitPrice});
}

/// @nodoc
class _$PutProductPurchaseCopyWithImpl<$Res, $Val extends PutProductPurchase>
    implements $PutProductPurchaseCopyWith<$Res> {
  _$PutProductPurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? productId = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_value.copyWith(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
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
}

/// @nodoc
abstract class _$$PutProductPurchaseImplCopyWith<$Res>
    implements $PutProductPurchaseCopyWith<$Res> {
  factory _$$PutProductPurchaseImplCopyWith(_$PutProductPurchaseImpl value,
          $Res Function(_$PutProductPurchaseImpl) then) =
      __$$PutProductPurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, int productId, int quantity, double unitPrice});
}

/// @nodoc
class __$$PutProductPurchaseImplCopyWithImpl<$Res>
    extends _$PutProductPurchaseCopyWithImpl<$Res, _$PutProductPurchaseImpl>
    implements _$$PutProductPurchaseImplCopyWith<$Res> {
  __$$PutProductPurchaseImplCopyWithImpl(_$PutProductPurchaseImpl _value,
      $Res Function(_$PutProductPurchaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? productId = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_$PutProductPurchaseImpl(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$PutProductPurchaseImpl extends _PutProductPurchase {
  const _$PutProductPurchaseImpl(
      {required this.shoppingId,
      required this.productId,
      required this.quantity,
      required this.unitPrice})
      : super._();

  factory _$PutProductPurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PutProductPurchaseImplFromJson(json);

  @override
  final int shoppingId;
  @override
  final int productId;
  @override
  final int quantity;
  @override
  final double unitPrice;

  @override
  String toString() {
    return 'PutProductPurchase(shoppingId: $shoppingId, productId: $productId, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PutProductPurchaseImpl &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, shoppingId, productId, quantity, unitPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PutProductPurchaseImplCopyWith<_$PutProductPurchaseImpl> get copyWith =>
      __$$PutProductPurchaseImplCopyWithImpl<_$PutProductPurchaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PutProductPurchaseImplToJson(
      this,
    );
  }
}

abstract class _PutProductPurchase extends PutProductPurchase {
  const factory _PutProductPurchase(
      {required final int shoppingId,
      required final int productId,
      required final int quantity,
      required final double unitPrice}) = _$PutProductPurchaseImpl;
  const _PutProductPurchase._() : super._();

  factory _PutProductPurchase.fromJson(Map<String, dynamic> json) =
      _$PutProductPurchaseImpl.fromJson;

  @override
  int get shoppingId;
  @override
  int get productId;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  @JsonKey(ignore: true)
  _$$PutProductPurchaseImplCopyWith<_$PutProductPurchaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
