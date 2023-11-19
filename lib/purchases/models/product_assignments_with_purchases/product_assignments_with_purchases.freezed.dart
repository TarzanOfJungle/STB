// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_assignments_with_purchases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductAssignmentsWithPurchases {
  List<ProductShoppingAssignment> get productAssignments =>
      throw _privateConstructorUsedError;
  List<ProductPurchase> get productPurchases =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductAssignmentsWithPurchasesCopyWith<ProductAssignmentsWithPurchases>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAssignmentsWithPurchasesCopyWith<$Res> {
  factory $ProductAssignmentsWithPurchasesCopyWith(
          ProductAssignmentsWithPurchases value,
          $Res Function(ProductAssignmentsWithPurchases) then) =
      _$ProductAssignmentsWithPurchasesCopyWithImpl<$Res,
          ProductAssignmentsWithPurchases>;
  @useResult
  $Res call(
      {List<ProductShoppingAssignment> productAssignments,
      List<ProductPurchase> productPurchases});
}

/// @nodoc
class _$ProductAssignmentsWithPurchasesCopyWithImpl<$Res,
        $Val extends ProductAssignmentsWithPurchases>
    implements $ProductAssignmentsWithPurchasesCopyWith<$Res> {
  _$ProductAssignmentsWithPurchasesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productAssignments = null,
    Object? productPurchases = null,
  }) {
    return _then(_value.copyWith(
      productAssignments: null == productAssignments
          ? _value.productAssignments
          : productAssignments // ignore: cast_nullable_to_non_nullable
              as List<ProductShoppingAssignment>,
      productPurchases: null == productPurchases
          ? _value.productPurchases
          : productPurchases // ignore: cast_nullable_to_non_nullable
              as List<ProductPurchase>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductAssignmentsWithPurchasesImplCopyWith<$Res>
    implements $ProductAssignmentsWithPurchasesCopyWith<$Res> {
  factory _$$ProductAssignmentsWithPurchasesImplCopyWith(
          _$ProductAssignmentsWithPurchasesImpl value,
          $Res Function(_$ProductAssignmentsWithPurchasesImpl) then) =
      __$$ProductAssignmentsWithPurchasesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductShoppingAssignment> productAssignments,
      List<ProductPurchase> productPurchases});
}

/// @nodoc
class __$$ProductAssignmentsWithPurchasesImplCopyWithImpl<$Res>
    extends _$ProductAssignmentsWithPurchasesCopyWithImpl<$Res,
        _$ProductAssignmentsWithPurchasesImpl>
    implements _$$ProductAssignmentsWithPurchasesImplCopyWith<$Res> {
  __$$ProductAssignmentsWithPurchasesImplCopyWithImpl(
      _$ProductAssignmentsWithPurchasesImpl _value,
      $Res Function(_$ProductAssignmentsWithPurchasesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productAssignments = null,
    Object? productPurchases = null,
  }) {
    return _then(_$ProductAssignmentsWithPurchasesImpl(
      productAssignments: null == productAssignments
          ? _value._productAssignments
          : productAssignments // ignore: cast_nullable_to_non_nullable
              as List<ProductShoppingAssignment>,
      productPurchases: null == productPurchases
          ? _value._productPurchases
          : productPurchases // ignore: cast_nullable_to_non_nullable
              as List<ProductPurchase>,
    ));
  }
}

/// @nodoc

class _$ProductAssignmentsWithPurchasesImpl
    extends _ProductAssignmentsWithPurchases {
  const _$ProductAssignmentsWithPurchasesImpl(
      {required final List<ProductShoppingAssignment> productAssignments,
      required final List<ProductPurchase> productPurchases})
      : _productAssignments = productAssignments,
        _productPurchases = productPurchases,
        super._();

  final List<ProductShoppingAssignment> _productAssignments;
  @override
  List<ProductShoppingAssignment> get productAssignments {
    if (_productAssignments is EqualUnmodifiableListView)
      return _productAssignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productAssignments);
  }

  final List<ProductPurchase> _productPurchases;
  @override
  List<ProductPurchase> get productPurchases {
    if (_productPurchases is EqualUnmodifiableListView)
      return _productPurchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productPurchases);
  }

  @override
  String toString() {
    return 'ProductAssignmentsWithPurchases(productAssignments: $productAssignments, productPurchases: $productPurchases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAssignmentsWithPurchasesImpl &&
            const DeepCollectionEquality()
                .equals(other._productAssignments, _productAssignments) &&
            const DeepCollectionEquality()
                .equals(other._productPurchases, _productPurchases));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productAssignments),
      const DeepCollectionEquality().hash(_productPurchases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAssignmentsWithPurchasesImplCopyWith<
          _$ProductAssignmentsWithPurchasesImpl>
      get copyWith => __$$ProductAssignmentsWithPurchasesImplCopyWithImpl<
          _$ProductAssignmentsWithPurchasesImpl>(this, _$identity);
}

abstract class _ProductAssignmentsWithPurchases
    extends ProductAssignmentsWithPurchases {
  const factory _ProductAssignmentsWithPurchases(
          {required final List<ProductShoppingAssignment> productAssignments,
          required final List<ProductPurchase> productPurchases}) =
      _$ProductAssignmentsWithPurchasesImpl;
  const _ProductAssignmentsWithPurchases._() : super._();

  @override
  List<ProductShoppingAssignment> get productAssignments;
  @override
  List<ProductPurchase> get productPurchases;
  @override
  @JsonKey(ignore: true)
  _$$ProductAssignmentsWithPurchasesImplCopyWith<
          _$ProductAssignmentsWithPurchasesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
