// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_with_purchase_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserWithPurchaseContext _$UserWithPurchaseContextFromJson(
    Map<String, dynamic> json) {
  return _UserWithPurchaseContext.fromJson(json);
}

/// @nodoc
mixin _$UserWithPurchaseContext {
  User get user => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserWithPurchaseContextCopyWith<UserWithPurchaseContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWithPurchaseContextCopyWith<$Res> {
  factory $UserWithPurchaseContextCopyWith(UserWithPurchaseContext value,
          $Res Function(UserWithPurchaseContext) then) =
      _$UserWithPurchaseContextCopyWithImpl<$Res, UserWithPurchaseContext>;
  @useResult
  $Res call({User user, int quantity, double unitPrice});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserWithPurchaseContextCopyWithImpl<$Res,
        $Val extends UserWithPurchaseContext>
    implements $UserWithPurchaseContextCopyWith<$Res> {
  _$UserWithPurchaseContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserWithPurchaseContextImplCopyWith<$Res>
    implements $UserWithPurchaseContextCopyWith<$Res> {
  factory _$$UserWithPurchaseContextImplCopyWith(
          _$UserWithPurchaseContextImpl value,
          $Res Function(_$UserWithPurchaseContextImpl) then) =
      __$$UserWithPurchaseContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, int quantity, double unitPrice});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserWithPurchaseContextImplCopyWithImpl<$Res>
    extends _$UserWithPurchaseContextCopyWithImpl<$Res,
        _$UserWithPurchaseContextImpl>
    implements _$$UserWithPurchaseContextImplCopyWith<$Res> {
  __$$UserWithPurchaseContextImplCopyWithImpl(
      _$UserWithPurchaseContextImpl _value,
      $Res Function(_$UserWithPurchaseContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_$UserWithPurchaseContextImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
class _$UserWithPurchaseContextImpl extends _UserWithPurchaseContext {
  const _$UserWithPurchaseContextImpl(
      {required this.user, required this.quantity, required this.unitPrice})
      : super._();

  factory _$UserWithPurchaseContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserWithPurchaseContextImplFromJson(json);

  @override
  final User user;
  @override
  final int quantity;
  @override
  final double unitPrice;

  @override
  String toString() {
    return 'UserWithPurchaseContext(user: $user, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWithPurchaseContextImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, quantity, unitPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWithPurchaseContextImplCopyWith<_$UserWithPurchaseContextImpl>
      get copyWith => __$$UserWithPurchaseContextImplCopyWithImpl<
          _$UserWithPurchaseContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserWithPurchaseContextImplToJson(
      this,
    );
  }
}

abstract class _UserWithPurchaseContext extends UserWithPurchaseContext {
  const factory _UserWithPurchaseContext(
      {required final User user,
      required final int quantity,
      required final double unitPrice}) = _$UserWithPurchaseContextImpl;
  const _UserWithPurchaseContext._() : super._();

  factory _UserWithPurchaseContext.fromJson(Map<String, dynamic> json) =
      _$UserWithPurchaseContextImpl.fromJson;

  @override
  User get user;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  @JsonKey(ignore: true)
  _$$UserWithPurchaseContextImplCopyWith<_$UserWithPurchaseContextImpl>
      get copyWith => throw _privateConstructorUsedError;
}
