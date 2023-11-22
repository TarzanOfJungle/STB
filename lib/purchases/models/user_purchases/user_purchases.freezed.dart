// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_purchases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPurchases _$UserPurchasesFromJson(Map<String, dynamic> json) {
  return _UserPurchases.fromJson(json);
}

/// @nodoc
mixin _$UserPurchases {
  User get user => throw _privateConstructorUsedError;
  List<ProductWithPurchaseContext> get productPurchases =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPurchasesCopyWith<UserPurchases> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPurchasesCopyWith<$Res> {
  factory $UserPurchasesCopyWith(
          UserPurchases value, $Res Function(UserPurchases) then) =
      _$UserPurchasesCopyWithImpl<$Res, UserPurchases>;
  @useResult
  $Res call({User user, List<ProductWithPurchaseContext> productPurchases});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserPurchasesCopyWithImpl<$Res, $Val extends UserPurchases>
    implements $UserPurchasesCopyWith<$Res> {
  _$UserPurchasesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? productPurchases = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      productPurchases: null == productPurchases
          ? _value.productPurchases
          : productPurchases // ignore: cast_nullable_to_non_nullable
              as List<ProductWithPurchaseContext>,
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
abstract class _$$UserPurchasesImplCopyWith<$Res>
    implements $UserPurchasesCopyWith<$Res> {
  factory _$$UserPurchasesImplCopyWith(
          _$UserPurchasesImpl value, $Res Function(_$UserPurchasesImpl) then) =
      __$$UserPurchasesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, List<ProductWithPurchaseContext> productPurchases});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserPurchasesImplCopyWithImpl<$Res>
    extends _$UserPurchasesCopyWithImpl<$Res, _$UserPurchasesImpl>
    implements _$$UserPurchasesImplCopyWith<$Res> {
  __$$UserPurchasesImplCopyWithImpl(
      _$UserPurchasesImpl _value, $Res Function(_$UserPurchasesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? productPurchases = null,
  }) {
    return _then(_$UserPurchasesImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      productPurchases: null == productPurchases
          ? _value._productPurchases
          : productPurchases // ignore: cast_nullable_to_non_nullable
              as List<ProductWithPurchaseContext>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPurchasesImpl extends _UserPurchases {
  const _$UserPurchasesImpl(
      {required this.user,
      required final List<ProductWithPurchaseContext> productPurchases})
      : _productPurchases = productPurchases,
        super._();

  factory _$UserPurchasesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPurchasesImplFromJson(json);

  @override
  final User user;
  final List<ProductWithPurchaseContext> _productPurchases;
  @override
  List<ProductWithPurchaseContext> get productPurchases {
    if (_productPurchases is EqualUnmodifiableListView)
      return _productPurchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productPurchases);
  }

  @override
  String toString() {
    return 'UserPurchases(user: $user, productPurchases: $productPurchases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPurchasesImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._productPurchases, _productPurchases));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user,
      const DeepCollectionEquality().hash(_productPurchases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPurchasesImplCopyWith<_$UserPurchasesImpl> get copyWith =>
      __$$UserPurchasesImplCopyWithImpl<_$UserPurchasesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPurchasesImplToJson(
      this,
    );
  }
}

abstract class _UserPurchases extends UserPurchases {
  const factory _UserPurchases(
          {required final User user,
          required final List<ProductWithPurchaseContext> productPurchases}) =
      _$UserPurchasesImpl;
  const _UserPurchases._() : super._();

  factory _UserPurchases.fromJson(Map<String, dynamic> json) =
      _$UserPurchasesImpl.fromJson;

  @override
  User get user;
  @override
  List<ProductWithPurchaseContext> get productPurchases;
  @override
  @JsonKey(ignore: true)
  _$$UserPurchasesImplCopyWith<_$UserPurchasesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
