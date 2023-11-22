// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_product_assignment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddProductAssignmentState {
  String? get productName => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductAssignmentStateCopyWith<AddProductAssignmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductAssignmentStateCopyWith<$Res> {
  factory $AddProductAssignmentStateCopyWith(AddProductAssignmentState value,
          $Res Function(AddProductAssignmentState) then) =
      _$AddProductAssignmentStateCopyWithImpl<$Res, AddProductAssignmentState>;
  @useResult
  $Res call({String? productName, int? quantity});
}

/// @nodoc
class _$AddProductAssignmentStateCopyWithImpl<$Res,
        $Val extends AddProductAssignmentState>
    implements $AddProductAssignmentStateCopyWith<$Res> {
  _$AddProductAssignmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddProductAssignmentStateImplCopyWith<$Res>
    implements $AddProductAssignmentStateCopyWith<$Res> {
  factory _$$AddProductAssignmentStateImplCopyWith(
          _$AddProductAssignmentStateImpl value,
          $Res Function(_$AddProductAssignmentStateImpl) then) =
      __$$AddProductAssignmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? productName, int? quantity});
}

/// @nodoc
class __$$AddProductAssignmentStateImplCopyWithImpl<$Res>
    extends _$AddProductAssignmentStateCopyWithImpl<$Res,
        _$AddProductAssignmentStateImpl>
    implements _$$AddProductAssignmentStateImplCopyWith<$Res> {
  __$$AddProductAssignmentStateImplCopyWithImpl(
      _$AddProductAssignmentStateImpl _value,
      $Res Function(_$AddProductAssignmentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$AddProductAssignmentStateImpl(
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AddProductAssignmentStateImpl extends _AddProductAssignmentState {
  const _$AddProductAssignmentStateImpl({this.productName, this.quantity})
      : super._();

  @override
  final String? productName;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'AddProductAssignmentState(productName: $productName, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductAssignmentStateImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productName, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductAssignmentStateImplCopyWith<_$AddProductAssignmentStateImpl>
      get copyWith => __$$AddProductAssignmentStateImplCopyWithImpl<
          _$AddProductAssignmentStateImpl>(this, _$identity);
}

abstract class _AddProductAssignmentState extends AddProductAssignmentState {
  const factory _AddProductAssignmentState(
      {final String? productName,
      final int? quantity}) = _$AddProductAssignmentStateImpl;
  const _AddProductAssignmentState._() : super._();

  @override
  String? get productName;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$AddProductAssignmentStateImplCopyWith<_$AddProductAssignmentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
