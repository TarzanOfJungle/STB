// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_product_purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatProductPurchase _$StatProductPurchaseFromJson(Map<String, dynamic> json) {
  return _StatProductPurchase.fromJson(json);
}

/// @nodoc
mixin _$StatProductPurchase {
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatProductPurchaseCopyWith<StatProductPurchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatProductPurchaseCopyWith<$Res> {
  factory $StatProductPurchaseCopyWith(
          StatProductPurchase value, $Res Function(StatProductPurchase) then) =
      _$StatProductPurchaseCopyWithImpl<$Res, StatProductPurchase>;
  @useResult
  $Res call(
      {int productId,
      int quantity,
      double unitPrice,
      DateTime created,
      DateTime updated});
}

/// @nodoc
class _$StatProductPurchaseCopyWithImpl<$Res, $Val extends StatProductPurchase>
    implements $StatProductPurchaseCopyWith<$Res> {
  _$StatProductPurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? created = null,
    Object? updated = null,
  }) {
    return _then(_value.copyWith(
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
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatProductPurchaseImplCopyWith<$Res>
    implements $StatProductPurchaseCopyWith<$Res> {
  factory _$$StatProductPurchaseImplCopyWith(_$StatProductPurchaseImpl value,
          $Res Function(_$StatProductPurchaseImpl) then) =
      __$$StatProductPurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int productId,
      int quantity,
      double unitPrice,
      DateTime created,
      DateTime updated});
}

/// @nodoc
class __$$StatProductPurchaseImplCopyWithImpl<$Res>
    extends _$StatProductPurchaseCopyWithImpl<$Res, _$StatProductPurchaseImpl>
    implements _$$StatProductPurchaseImplCopyWith<$Res> {
  __$$StatProductPurchaseImplCopyWithImpl(_$StatProductPurchaseImpl _value,
      $Res Function(_$StatProductPurchaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? created = null,
    Object? updated = null,
  }) {
    return _then(_$StatProductPurchaseImpl(
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
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatProductPurchaseImpl extends _StatProductPurchase {
  const _$StatProductPurchaseImpl(
      {required this.productId,
      required this.quantity,
      required this.unitPrice,
      required this.created,
      required this.updated})
      : super._();

  factory _$StatProductPurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatProductPurchaseImplFromJson(json);

  @override
  final int productId;
  @override
  final int quantity;
  @override
  final double unitPrice;
  @override
  final DateTime created;
  @override
  final DateTime updated;

  @override
  String toString() {
    return 'StatProductPurchase(productId: $productId, quantity: $quantity, unitPrice: $unitPrice, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatProductPurchaseImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, quantity, unitPrice, created, updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatProductPurchaseImplCopyWith<_$StatProductPurchaseImpl> get copyWith =>
      __$$StatProductPurchaseImplCopyWithImpl<_$StatProductPurchaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatProductPurchaseImplToJson(
      this,
    );
  }
}

abstract class _StatProductPurchase extends StatProductPurchase {
  const factory _StatProductPurchase(
      {required final int productId,
      required final int quantity,
      required final double unitPrice,
      required final DateTime created,
      required final DateTime updated}) = _$StatProductPurchaseImpl;
  const _StatProductPurchase._() : super._();

  factory _StatProductPurchase.fromJson(Map<String, dynamic> json) =
      _$StatProductPurchaseImpl.fromJson;

  @override
  int get productId;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override
  @JsonKey(ignore: true)
  _$$StatProductPurchaseImplCopyWith<_$StatProductPurchaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
