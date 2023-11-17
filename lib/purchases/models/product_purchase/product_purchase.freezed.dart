// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductPurchase _$ProductPurchaseFromJson(Map<String, dynamic> json) {
  return _ProductPurchase.fromJson(json);
}

/// @nodoc
mixin _$ProductPurchase {
  Product get product => throw _privateConstructorUsedError;
  int get totalQuantityToBePurchased => throw _privateConstructorUsedError;
  List<UserWithPurchaseContext> get userPurchases =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductPurchaseCopyWith<ProductPurchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPurchaseCopyWith<$Res> {
  factory $ProductPurchaseCopyWith(
          ProductPurchase value, $Res Function(ProductPurchase) then) =
      _$ProductPurchaseCopyWithImpl<$Res, ProductPurchase>;
  @useResult
  $Res call(
      {Product product,
      int totalQuantityToBePurchased,
      List<UserWithPurchaseContext> userPurchases});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductPurchaseCopyWithImpl<$Res, $Val extends ProductPurchase>
    implements $ProductPurchaseCopyWith<$Res> {
  _$ProductPurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? totalQuantityToBePurchased = null,
    Object? userPurchases = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      totalQuantityToBePurchased: null == totalQuantityToBePurchased
          ? _value.totalQuantityToBePurchased
          : totalQuantityToBePurchased // ignore: cast_nullable_to_non_nullable
              as int,
      userPurchases: null == userPurchases
          ? _value.userPurchases
          : userPurchases // ignore: cast_nullable_to_non_nullable
              as List<UserWithPurchaseContext>,
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
abstract class _$$ProductPurchaseImplCopyWith<$Res>
    implements $ProductPurchaseCopyWith<$Res> {
  factory _$$ProductPurchaseImplCopyWith(_$ProductPurchaseImpl value,
          $Res Function(_$ProductPurchaseImpl) then) =
      __$$ProductPurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Product product,
      int totalQuantityToBePurchased,
      List<UserWithPurchaseContext> userPurchases});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductPurchaseImplCopyWithImpl<$Res>
    extends _$ProductPurchaseCopyWithImpl<$Res, _$ProductPurchaseImpl>
    implements _$$ProductPurchaseImplCopyWith<$Res> {
  __$$ProductPurchaseImplCopyWithImpl(
      _$ProductPurchaseImpl _value, $Res Function(_$ProductPurchaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? totalQuantityToBePurchased = null,
    Object? userPurchases = null,
  }) {
    return _then(_$ProductPurchaseImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      totalQuantityToBePurchased: null == totalQuantityToBePurchased
          ? _value.totalQuantityToBePurchased
          : totalQuantityToBePurchased // ignore: cast_nullable_to_non_nullable
              as int,
      userPurchases: null == userPurchases
          ? _value._userPurchases
          : userPurchases // ignore: cast_nullable_to_non_nullable
              as List<UserWithPurchaseContext>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductPurchaseImpl extends _ProductPurchase {
  const _$ProductPurchaseImpl(
      {required this.product,
      required this.totalQuantityToBePurchased,
      required final List<UserWithPurchaseContext> userPurchases})
      : _userPurchases = userPurchases,
        super._();

  factory _$ProductPurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPurchaseImplFromJson(json);

  @override
  final Product product;
  @override
  final int totalQuantityToBePurchased;
  final List<UserWithPurchaseContext> _userPurchases;
  @override
  List<UserWithPurchaseContext> get userPurchases {
    if (_userPurchases is EqualUnmodifiableListView) return _userPurchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userPurchases);
  }

  @override
  String toString() {
    return 'ProductPurchase(product: $product, totalQuantityToBePurchased: $totalQuantityToBePurchased, userPurchases: $userPurchases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPurchaseImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.totalQuantityToBePurchased,
                    totalQuantityToBePurchased) ||
                other.totalQuantityToBePurchased ==
                    totalQuantityToBePurchased) &&
            const DeepCollectionEquality()
                .equals(other._userPurchases, _userPurchases));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      product,
      totalQuantityToBePurchased,
      const DeepCollectionEquality().hash(_userPurchases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPurchaseImplCopyWith<_$ProductPurchaseImpl> get copyWith =>
      __$$ProductPurchaseImplCopyWithImpl<_$ProductPurchaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPurchaseImplToJson(
      this,
    );
  }
}

abstract class _ProductPurchase extends ProductPurchase {
  const factory _ProductPurchase(
          {required final Product product,
          required final int totalQuantityToBePurchased,
          required final List<UserWithPurchaseContext> userPurchases}) =
      _$ProductPurchaseImpl;
  const _ProductPurchase._() : super._();

  factory _ProductPurchase.fromJson(Map<String, dynamic> json) =
      _$ProductPurchaseImpl.fromJson;

  @override
  Product get product;
  @override
  int get totalQuantityToBePurchased;
  @override
  List<UserWithPurchaseContext> get userPurchases;
  @override
  @JsonKey(ignore: true)
  _$$ProductPurchaseImplCopyWith<_$ProductPurchaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
