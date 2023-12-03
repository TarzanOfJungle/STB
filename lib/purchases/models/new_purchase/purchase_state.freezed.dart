// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchaseState {
  int get currentUserId => throw _privateConstructorUsedError;
  int get currentShoppingId => throw _privateConstructorUsedError;
  ProductShoppingAssignment get existingAssignment =>
      throw _privateConstructorUsedError;
  ProductPurchase? get existingPurchases => throw _privateConstructorUsedError;
  int? get editedQuantity => throw _privateConstructorUsedError;
  double? get editedUnitPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseStateCopyWith<PurchaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseStateCopyWith<$Res> {
  factory $PurchaseStateCopyWith(
          PurchaseState value, $Res Function(PurchaseState) then) =
      _$PurchaseStateCopyWithImpl<$Res, PurchaseState>;
  @useResult
  $Res call(
      {int currentUserId,
      int currentShoppingId,
      ProductShoppingAssignment existingAssignment,
      ProductPurchase? existingPurchases,
      int? editedQuantity,
      double? editedUnitPrice});

  $ProductShoppingAssignmentCopyWith<$Res> get existingAssignment;
  $ProductPurchaseCopyWith<$Res>? get existingPurchases;
}

/// @nodoc
class _$PurchaseStateCopyWithImpl<$Res, $Val extends PurchaseState>
    implements $PurchaseStateCopyWith<$Res> {
  _$PurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUserId = null,
    Object? currentShoppingId = null,
    Object? existingAssignment = null,
    Object? existingPurchases = freezed,
    Object? editedQuantity = freezed,
    Object? editedUnitPrice = freezed,
  }) {
    return _then(_value.copyWith(
      currentUserId: null == currentUserId
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as int,
      currentShoppingId: null == currentShoppingId
          ? _value.currentShoppingId
          : currentShoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      existingAssignment: null == existingAssignment
          ? _value.existingAssignment
          : existingAssignment // ignore: cast_nullable_to_non_nullable
              as ProductShoppingAssignment,
      existingPurchases: freezed == existingPurchases
          ? _value.existingPurchases
          : existingPurchases // ignore: cast_nullable_to_non_nullable
              as ProductPurchase?,
      editedQuantity: freezed == editedQuantity
          ? _value.editedQuantity
          : editedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      editedUnitPrice: freezed == editedUnitPrice
          ? _value.editedUnitPrice
          : editedUnitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductShoppingAssignmentCopyWith<$Res> get existingAssignment {
    return $ProductShoppingAssignmentCopyWith<$Res>(_value.existingAssignment,
        (value) {
      return _then(_value.copyWith(existingAssignment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductPurchaseCopyWith<$Res>? get existingPurchases {
    if (_value.existingPurchases == null) {
      return null;
    }

    return $ProductPurchaseCopyWith<$Res>(_value.existingPurchases!, (value) {
      return _then(_value.copyWith(existingPurchases: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseStateImplCopyWith<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  factory _$$PurchaseStateImplCopyWith(
          _$PurchaseStateImpl value, $Res Function(_$PurchaseStateImpl) then) =
      __$$PurchaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentUserId,
      int currentShoppingId,
      ProductShoppingAssignment existingAssignment,
      ProductPurchase? existingPurchases,
      int? editedQuantity,
      double? editedUnitPrice});

  @override
  $ProductShoppingAssignmentCopyWith<$Res> get existingAssignment;
  @override
  $ProductPurchaseCopyWith<$Res>? get existingPurchases;
}

/// @nodoc
class __$$PurchaseStateImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStateImpl>
    implements _$$PurchaseStateImplCopyWith<$Res> {
  __$$PurchaseStateImplCopyWithImpl(
      _$PurchaseStateImpl _value, $Res Function(_$PurchaseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUserId = null,
    Object? currentShoppingId = null,
    Object? existingAssignment = null,
    Object? existingPurchases = freezed,
    Object? editedQuantity = freezed,
    Object? editedUnitPrice = freezed,
  }) {
    return _then(_$PurchaseStateImpl(
      currentUserId: null == currentUserId
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as int,
      currentShoppingId: null == currentShoppingId
          ? _value.currentShoppingId
          : currentShoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      existingAssignment: null == existingAssignment
          ? _value.existingAssignment
          : existingAssignment // ignore: cast_nullable_to_non_nullable
              as ProductShoppingAssignment,
      existingPurchases: freezed == existingPurchases
          ? _value.existingPurchases
          : existingPurchases // ignore: cast_nullable_to_non_nullable
              as ProductPurchase?,
      editedQuantity: freezed == editedQuantity
          ? _value.editedQuantity
          : editedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      editedUnitPrice: freezed == editedUnitPrice
          ? _value.editedUnitPrice
          : editedUnitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$PurchaseStateImpl extends _PurchaseState {
  const _$PurchaseStateImpl(
      {required this.currentUserId,
      required this.currentShoppingId,
      required this.existingAssignment,
      this.existingPurchases,
      this.editedQuantity,
      this.editedUnitPrice})
      : super._();

  @override
  final int currentUserId;
  @override
  final int currentShoppingId;
  @override
  final ProductShoppingAssignment existingAssignment;
  @override
  final ProductPurchase? existingPurchases;
  @override
  final int? editedQuantity;
  @override
  final double? editedUnitPrice;

  @override
  String toString() {
    return 'PurchaseState(currentUserId: $currentUserId, currentShoppingId: $currentShoppingId, existingAssignment: $existingAssignment, existingPurchases: $existingPurchases, editedQuantity: $editedQuantity, editedUnitPrice: $editedUnitPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStateImpl &&
            (identical(other.currentUserId, currentUserId) ||
                other.currentUserId == currentUserId) &&
            (identical(other.currentShoppingId, currentShoppingId) ||
                other.currentShoppingId == currentShoppingId) &&
            (identical(other.existingAssignment, existingAssignment) ||
                other.existingAssignment == existingAssignment) &&
            (identical(other.existingPurchases, existingPurchases) ||
                other.existingPurchases == existingPurchases) &&
            (identical(other.editedQuantity, editedQuantity) ||
                other.editedQuantity == editedQuantity) &&
            (identical(other.editedUnitPrice, editedUnitPrice) ||
                other.editedUnitPrice == editedUnitPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentUserId, currentShoppingId,
      existingAssignment, existingPurchases, editedQuantity, editedUnitPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseStateImplCopyWith<_$PurchaseStateImpl> get copyWith =>
      __$$PurchaseStateImplCopyWithImpl<_$PurchaseStateImpl>(this, _$identity);
}

abstract class _PurchaseState extends PurchaseState {
  const factory _PurchaseState(
      {required final int currentUserId,
      required final int currentShoppingId,
      required final ProductShoppingAssignment existingAssignment,
      final ProductPurchase? existingPurchases,
      final int? editedQuantity,
      final double? editedUnitPrice}) = _$PurchaseStateImpl;
  const _PurchaseState._() : super._();

  @override
  int get currentUserId;
  @override
  int get currentShoppingId;
  @override
  ProductShoppingAssignment get existingAssignment;
  @override
  ProductPurchase? get existingPurchases;
  @override
  int? get editedQuantity;
  @override
  double? get editedUnitPrice;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseStateImplCopyWith<_$PurchaseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
