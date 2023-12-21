// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'put_product_shopping_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PutProductShoppingAssignment _$PutProductShoppingAssignmentFromJson(
    Map<String, dynamic> json) {
  return _PutProductShoppingAssignment.fromJson(json);
}

/// @nodoc
mixin _$PutProductShoppingAssignment {
  int get shoppingId => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PutProductShoppingAssignmentCopyWith<PutProductShoppingAssignment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PutProductShoppingAssignmentCopyWith<$Res> {
  factory $PutProductShoppingAssignmentCopyWith(
          PutProductShoppingAssignment value,
          $Res Function(PutProductShoppingAssignment) then) =
      _$PutProductShoppingAssignmentCopyWithImpl<$Res,
          PutProductShoppingAssignment>;
  @useResult
  $Res call({int shoppingId, int productId, int quantity});
}

/// @nodoc
class _$PutProductShoppingAssignmentCopyWithImpl<$Res,
        $Val extends PutProductShoppingAssignment>
    implements $PutProductShoppingAssignmentCopyWith<$Res> {
  _$PutProductShoppingAssignmentCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PutProductShoppingAssignmentImplCopyWith<$Res>
    implements $PutProductShoppingAssignmentCopyWith<$Res> {
  factory _$$PutProductShoppingAssignmentImplCopyWith(
          _$PutProductShoppingAssignmentImpl value,
          $Res Function(_$PutProductShoppingAssignmentImpl) then) =
      __$$PutProductShoppingAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, int productId, int quantity});
}

/// @nodoc
class __$$PutProductShoppingAssignmentImplCopyWithImpl<$Res>
    extends _$PutProductShoppingAssignmentCopyWithImpl<$Res,
        _$PutProductShoppingAssignmentImpl>
    implements _$$PutProductShoppingAssignmentImplCopyWith<$Res> {
  __$$PutProductShoppingAssignmentImplCopyWithImpl(
      _$PutProductShoppingAssignmentImpl _value,
      $Res Function(_$PutProductShoppingAssignmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_$PutProductShoppingAssignmentImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PutProductShoppingAssignmentImpl extends _PutProductShoppingAssignment {
  const _$PutProductShoppingAssignmentImpl(
      {required this.shoppingId,
      required this.productId,
      required this.quantity})
      : super._();

  factory _$PutProductShoppingAssignmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PutProductShoppingAssignmentImplFromJson(json);

  @override
  final int shoppingId;
  @override
  final int productId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'PutProductShoppingAssignment(shoppingId: $shoppingId, productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PutProductShoppingAssignmentImpl &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shoppingId, productId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PutProductShoppingAssignmentImplCopyWith<
          _$PutProductShoppingAssignmentImpl>
      get copyWith => __$$PutProductShoppingAssignmentImplCopyWithImpl<
          _$PutProductShoppingAssignmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PutProductShoppingAssignmentImplToJson(
      this,
    );
  }
}

abstract class _PutProductShoppingAssignment
    extends PutProductShoppingAssignment {
  const factory _PutProductShoppingAssignment(
      {required final int shoppingId,
      required final int productId,
      required final int quantity}) = _$PutProductShoppingAssignmentImpl;
  const _PutProductShoppingAssignment._() : super._();

  factory _PutProductShoppingAssignment.fromJson(Map<String, dynamic> json) =
      _$PutProductShoppingAssignmentImpl.fromJson;

  @override
  int get shoppingId;
  @override
  int get productId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$PutProductShoppingAssignmentImplCopyWith<
          _$PutProductShoppingAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
