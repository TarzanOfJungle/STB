// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_user_purchases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatUserPurchases _$StatUserPurchasesFromJson(Map<String, dynamic> json) {
  return _StatUserPurchases.fromJson(json);
}

/// @nodoc
mixin _$StatUserPurchases {
  int get userId => throw _privateConstructorUsedError;
  List<StatProductPurchase> get productPurchases =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatUserPurchasesCopyWith<StatUserPurchases> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatUserPurchasesCopyWith<$Res> {
  factory $StatUserPurchasesCopyWith(
          StatUserPurchases value, $Res Function(StatUserPurchases) then) =
      _$StatUserPurchasesCopyWithImpl<$Res, StatUserPurchases>;
  @useResult
  $Res call({int userId, List<StatProductPurchase> productPurchases});
}

/// @nodoc
class _$StatUserPurchasesCopyWithImpl<$Res, $Val extends StatUserPurchases>
    implements $StatUserPurchasesCopyWith<$Res> {
  _$StatUserPurchasesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? productPurchases = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      productPurchases: null == productPurchases
          ? _value.productPurchases
          : productPurchases // ignore: cast_nullable_to_non_nullable
              as List<StatProductPurchase>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatUserPurchasesImplCopyWith<$Res>
    implements $StatUserPurchasesCopyWith<$Res> {
  factory _$$StatUserPurchasesImplCopyWith(_$StatUserPurchasesImpl value,
          $Res Function(_$StatUserPurchasesImpl) then) =
      __$$StatUserPurchasesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, List<StatProductPurchase> productPurchases});
}

/// @nodoc
class __$$StatUserPurchasesImplCopyWithImpl<$Res>
    extends _$StatUserPurchasesCopyWithImpl<$Res, _$StatUserPurchasesImpl>
    implements _$$StatUserPurchasesImplCopyWith<$Res> {
  __$$StatUserPurchasesImplCopyWithImpl(_$StatUserPurchasesImpl _value,
      $Res Function(_$StatUserPurchasesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? productPurchases = null,
  }) {
    return _then(_$StatUserPurchasesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      productPurchases: null == productPurchases
          ? _value._productPurchases
          : productPurchases // ignore: cast_nullable_to_non_nullable
              as List<StatProductPurchase>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatUserPurchasesImpl extends _StatUserPurchases {
  const _$StatUserPurchasesImpl(
      {required this.userId,
      required final List<StatProductPurchase> productPurchases})
      : _productPurchases = productPurchases,
        super._();

  factory _$StatUserPurchasesImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatUserPurchasesImplFromJson(json);

  @override
  final int userId;
  final List<StatProductPurchase> _productPurchases;
  @override
  List<StatProductPurchase> get productPurchases {
    if (_productPurchases is EqualUnmodifiableListView)
      return _productPurchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productPurchases);
  }

  @override
  String toString() {
    return 'StatUserPurchases(userId: $userId, productPurchases: $productPurchases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatUserPurchasesImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._productPurchases, _productPurchases));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(_productPurchases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatUserPurchasesImplCopyWith<_$StatUserPurchasesImpl> get copyWith =>
      __$$StatUserPurchasesImplCopyWithImpl<_$StatUserPurchasesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatUserPurchasesImplToJson(
      this,
    );
  }
}

abstract class _StatUserPurchases extends StatUserPurchases {
  const factory _StatUserPurchases(
          {required final int userId,
          required final List<StatProductPurchase> productPurchases}) =
      _$StatUserPurchasesImpl;
  const _StatUserPurchases._() : super._();

  factory _StatUserPurchases.fromJson(Map<String, dynamic> json) =
      _$StatUserPurchasesImpl.fromJson;

  @override
  int get userId;
  @override
  List<StatProductPurchase> get productPurchases;
  @override
  @JsonKey(ignore: true)
  _$$StatUserPurchasesImplCopyWith<_$StatUserPurchasesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
