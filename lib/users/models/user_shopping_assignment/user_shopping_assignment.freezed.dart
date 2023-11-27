// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_shopping_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserShoppingAssignment _$UserShoppingAssignmentFromJson(
    Map<String, dynamic> json) {
  return _UserShoppingAssignment.fromJson(json);
}

/// @nodoc
mixin _$UserShoppingAssignment {
  int get shoppingId => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserShoppingAssignmentCopyWith<UserShoppingAssignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserShoppingAssignmentCopyWith<$Res> {
  factory $UserShoppingAssignmentCopyWith(UserShoppingAssignment value,
          $Res Function(UserShoppingAssignment) then) =
      _$UserShoppingAssignmentCopyWithImpl<$Res, UserShoppingAssignment>;
  @useResult
  $Res call({int shoppingId, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserShoppingAssignmentCopyWithImpl<$Res,
        $Val extends UserShoppingAssignment>
    implements $UserShoppingAssignmentCopyWith<$Res> {
  _$UserShoppingAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
abstract class _$$UserShoppingAssignmentImplCopyWith<$Res>
    implements $UserShoppingAssignmentCopyWith<$Res> {
  factory _$$UserShoppingAssignmentImplCopyWith(
          _$UserShoppingAssignmentImpl value,
          $Res Function(_$UserShoppingAssignmentImpl) then) =
      __$$UserShoppingAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserShoppingAssignmentImplCopyWithImpl<$Res>
    extends _$UserShoppingAssignmentCopyWithImpl<$Res,
        _$UserShoppingAssignmentImpl>
    implements _$$UserShoppingAssignmentImplCopyWith<$Res> {
  __$$UserShoppingAssignmentImplCopyWithImpl(
      _$UserShoppingAssignmentImpl _value,
      $Res Function(_$UserShoppingAssignmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? user = null,
  }) {
    return _then(_$UserShoppingAssignmentImpl(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserShoppingAssignmentImpl extends _UserShoppingAssignment {
  const _$UserShoppingAssignmentImpl(
      {required this.shoppingId, required this.user})
      : super._();

  factory _$UserShoppingAssignmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserShoppingAssignmentImplFromJson(json);

  @override
  final int shoppingId;
  @override
  final User user;

  @override
  String toString() {
    return 'UserShoppingAssignment(shoppingId: $shoppingId, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserShoppingAssignmentImpl &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shoppingId, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserShoppingAssignmentImplCopyWith<_$UserShoppingAssignmentImpl>
      get copyWith => __$$UserShoppingAssignmentImplCopyWithImpl<
          _$UserShoppingAssignmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserShoppingAssignmentImplToJson(
      this,
    );
  }
}

abstract class _UserShoppingAssignment extends UserShoppingAssignment {
  const factory _UserShoppingAssignment(
      {required final int shoppingId,
      required final User user}) = _$UserShoppingAssignmentImpl;
  const _UserShoppingAssignment._() : super._();

  factory _UserShoppingAssignment.fromJson(Map<String, dynamic> json) =
      _$UserShoppingAssignmentImpl.fromJson;

  @override
  int get shoppingId;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$UserShoppingAssignmentImplCopyWith<_$UserShoppingAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
