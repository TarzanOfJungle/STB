// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_changed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseChanged _$PurchaseChangedFromJson(Map<String, dynamic> json) {
  return _PurchaseChanged.fromJson(json);
}

/// @nodoc
mixin _$PurchaseChanged {
  int get shoppingId => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseChangedCopyWith<PurchaseChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseChangedCopyWith<$Res> {
  factory $PurchaseChangedCopyWith(
          PurchaseChanged value, $Res Function(PurchaseChanged) then) =
      _$PurchaseChangedCopyWithImpl<$Res, PurchaseChanged>;
  @useResult
  $Res call({int shoppingId, int productId, int userId});
}

/// @nodoc
class _$PurchaseChangedCopyWithImpl<$Res, $Val extends PurchaseChanged>
    implements $PurchaseChangedCopyWith<$Res> {
  _$PurchaseChangedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? productId = null,
    Object? userId = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseChangedImplCopyWith<$Res>
    implements $PurchaseChangedCopyWith<$Res> {
  factory _$$PurchaseChangedImplCopyWith(_$PurchaseChangedImpl value,
          $Res Function(_$PurchaseChangedImpl) then) =
      __$$PurchaseChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, int productId, int userId});
}

/// @nodoc
class __$$PurchaseChangedImplCopyWithImpl<$Res>
    extends _$PurchaseChangedCopyWithImpl<$Res, _$PurchaseChangedImpl>
    implements _$$PurchaseChangedImplCopyWith<$Res> {
  __$$PurchaseChangedImplCopyWithImpl(
      _$PurchaseChangedImpl _value, $Res Function(_$PurchaseChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? productId = null,
    Object? userId = null,
  }) {
    return _then(_$PurchaseChangedImpl(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseChangedImpl extends _PurchaseChanged {
  const _$PurchaseChangedImpl(
      {required this.shoppingId, required this.productId, required this.userId})
      : super._();

  factory _$PurchaseChangedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseChangedImplFromJson(json);

  @override
  final int shoppingId;
  @override
  final int productId;
  @override
  final int userId;

  @override
  String toString() {
    return 'PurchaseChanged(shoppingId: $shoppingId, productId: $productId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseChangedImpl &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shoppingId, productId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseChangedImplCopyWith<_$PurchaseChangedImpl> get copyWith =>
      __$$PurchaseChangedImplCopyWithImpl<_$PurchaseChangedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseChangedImplToJson(
      this,
    );
  }
}

abstract class _PurchaseChanged extends PurchaseChanged {
  const factory _PurchaseChanged(
      {required final int shoppingId,
      required final int productId,
      required final int userId}) = _$PurchaseChangedImpl;
  const _PurchaseChanged._() : super._();

  factory _PurchaseChanged.fromJson(Map<String, dynamic> json) =
      _$PurchaseChangedImpl.fromJson;

  @override
  int get shoppingId;
  @override
  int get productId;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseChangedImplCopyWith<_$PurchaseChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
