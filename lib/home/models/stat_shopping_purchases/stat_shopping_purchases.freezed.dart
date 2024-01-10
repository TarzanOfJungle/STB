// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_shopping_purchases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatShoppingPurchases _$StatShoppingPurchasesFromJson(
    Map<String, dynamic> json) {
  return _StatShoppingPurchases.fromJson(json);
}

/// @nodoc
mixin _$StatShoppingPurchases {
  int get shoppingId => throw _privateConstructorUsedError;
  List<StatUserPurchases> get userPurchases =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatShoppingPurchasesCopyWith<StatShoppingPurchases> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatShoppingPurchasesCopyWith<$Res> {
  factory $StatShoppingPurchasesCopyWith(StatShoppingPurchases value,
          $Res Function(StatShoppingPurchases) then) =
      _$StatShoppingPurchasesCopyWithImpl<$Res, StatShoppingPurchases>;
  @useResult
  $Res call({int shoppingId, List<StatUserPurchases> userPurchases});
}

/// @nodoc
class _$StatShoppingPurchasesCopyWithImpl<$Res,
        $Val extends StatShoppingPurchases>
    implements $StatShoppingPurchasesCopyWith<$Res> {
  _$StatShoppingPurchasesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? userPurchases = null,
  }) {
    return _then(_value.copyWith(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      userPurchases: null == userPurchases
          ? _value.userPurchases
          : userPurchases // ignore: cast_nullable_to_non_nullable
              as List<StatUserPurchases>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatShoppingPurchasesImplCopyWith<$Res>
    implements $StatShoppingPurchasesCopyWith<$Res> {
  factory _$$StatShoppingPurchasesImplCopyWith(
          _$StatShoppingPurchasesImpl value,
          $Res Function(_$StatShoppingPurchasesImpl) then) =
      __$$StatShoppingPurchasesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, List<StatUserPurchases> userPurchases});
}

/// @nodoc
class __$$StatShoppingPurchasesImplCopyWithImpl<$Res>
    extends _$StatShoppingPurchasesCopyWithImpl<$Res,
        _$StatShoppingPurchasesImpl>
    implements _$$StatShoppingPurchasesImplCopyWith<$Res> {
  __$$StatShoppingPurchasesImplCopyWithImpl(_$StatShoppingPurchasesImpl _value,
      $Res Function(_$StatShoppingPurchasesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? userPurchases = null,
  }) {
    return _then(_$StatShoppingPurchasesImpl(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      userPurchases: null == userPurchases
          ? _value._userPurchases
          : userPurchases // ignore: cast_nullable_to_non_nullable
              as List<StatUserPurchases>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatShoppingPurchasesImpl extends _StatShoppingPurchases {
  const _$StatShoppingPurchasesImpl(
      {required this.shoppingId,
      required final List<StatUserPurchases> userPurchases})
      : _userPurchases = userPurchases,
        super._();

  factory _$StatShoppingPurchasesImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatShoppingPurchasesImplFromJson(json);

  @override
  final int shoppingId;
  final List<StatUserPurchases> _userPurchases;
  @override
  List<StatUserPurchases> get userPurchases {
    if (_userPurchases is EqualUnmodifiableListView) return _userPurchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userPurchases);
  }

  @override
  String toString() {
    return 'StatShoppingPurchases(shoppingId: $shoppingId, userPurchases: $userPurchases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatShoppingPurchasesImpl &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            const DeepCollectionEquality()
                .equals(other._userPurchases, _userPurchases));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shoppingId,
      const DeepCollectionEquality().hash(_userPurchases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatShoppingPurchasesImplCopyWith<_$StatShoppingPurchasesImpl>
      get copyWith => __$$StatShoppingPurchasesImplCopyWithImpl<
          _$StatShoppingPurchasesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatShoppingPurchasesImplToJson(
      this,
    );
  }
}

abstract class _StatShoppingPurchases extends StatShoppingPurchases {
  const factory _StatShoppingPurchases(
          {required final int shoppingId,
          required final List<StatUserPurchases> userPurchases}) =
      _$StatShoppingPurchasesImpl;
  const _StatShoppingPurchases._() : super._();

  factory _StatShoppingPurchases.fromJson(Map<String, dynamic> json) =
      _$StatShoppingPurchasesImpl.fromJson;

  @override
  int get shoppingId;
  @override
  List<StatUserPurchases> get userPurchases;
  @override
  @JsonKey(ignore: true)
  _$$StatShoppingPurchasesImplCopyWith<_$StatShoppingPurchasesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
