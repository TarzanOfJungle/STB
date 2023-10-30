// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_with_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShoppingWithContext _$ShoppingWithContextFromJson(Map<String, dynamic> json) {
  return _ShoppingWithContext.fromJson(json);
}

/// @nodoc
mixin _$ShoppingWithContext {
  Shopping get shopping => throw _privateConstructorUsedError;
  int get numberOfItems => throw _privateConstructorUsedError;
  double get ammountSpent => throw _privateConstructorUsedError;
  int get numberOfParticipants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingWithContextCopyWith<ShoppingWithContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingWithContextCopyWith<$Res> {
  factory $ShoppingWithContextCopyWith(
          ShoppingWithContext value, $Res Function(ShoppingWithContext) then) =
      _$ShoppingWithContextCopyWithImpl<$Res, ShoppingWithContext>;
  @useResult
  $Res call(
      {Shopping shopping,
      int numberOfItems,
      double ammountSpent,
      int numberOfParticipants});

  $ShoppingCopyWith<$Res> get shopping;
}

/// @nodoc
class _$ShoppingWithContextCopyWithImpl<$Res, $Val extends ShoppingWithContext>
    implements $ShoppingWithContextCopyWith<$Res> {
  _$ShoppingWithContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopping = null,
    Object? numberOfItems = null,
    Object? ammountSpent = null,
    Object? numberOfParticipants = null,
  }) {
    return _then(_value.copyWith(
      shopping: null == shopping
          ? _value.shopping
          : shopping // ignore: cast_nullable_to_non_nullable
              as Shopping,
      numberOfItems: null == numberOfItems
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      ammountSpent: null == ammountSpent
          ? _value.ammountSpent
          : ammountSpent // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfParticipants: null == numberOfParticipants
          ? _value.numberOfParticipants
          : numberOfParticipants // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShoppingCopyWith<$Res> get shopping {
    return $ShoppingCopyWith<$Res>(_value.shopping, (value) {
      return _then(_value.copyWith(shopping: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShoppingWithContextImplCopyWith<$Res>
    implements $ShoppingWithContextCopyWith<$Res> {
  factory _$$ShoppingWithContextImplCopyWith(_$ShoppingWithContextImpl value,
          $Res Function(_$ShoppingWithContextImpl) then) =
      __$$ShoppingWithContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Shopping shopping,
      int numberOfItems,
      double ammountSpent,
      int numberOfParticipants});

  @override
  $ShoppingCopyWith<$Res> get shopping;
}

/// @nodoc
class __$$ShoppingWithContextImplCopyWithImpl<$Res>
    extends _$ShoppingWithContextCopyWithImpl<$Res, _$ShoppingWithContextImpl>
    implements _$$ShoppingWithContextImplCopyWith<$Res> {
  __$$ShoppingWithContextImplCopyWithImpl(_$ShoppingWithContextImpl _value,
      $Res Function(_$ShoppingWithContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopping = null,
    Object? numberOfItems = null,
    Object? ammountSpent = null,
    Object? numberOfParticipants = null,
  }) {
    return _then(_$ShoppingWithContextImpl(
      shopping: null == shopping
          ? _value.shopping
          : shopping // ignore: cast_nullable_to_non_nullable
              as Shopping,
      numberOfItems: null == numberOfItems
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      ammountSpent: null == ammountSpent
          ? _value.ammountSpent
          : ammountSpent // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfParticipants: null == numberOfParticipants
          ? _value.numberOfParticipants
          : numberOfParticipants // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingWithContextImpl extends _ShoppingWithContext {
  const _$ShoppingWithContextImpl(
      {required this.shopping,
      required this.numberOfItems,
      required this.ammountSpent,
      required this.numberOfParticipants})
      : super._();

  factory _$ShoppingWithContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingWithContextImplFromJson(json);

  @override
  final Shopping shopping;
  @override
  final int numberOfItems;
  @override
  final double ammountSpent;
  @override
  final int numberOfParticipants;

  @override
  String toString() {
    return 'ShoppingWithContext(shopping: $shopping, numberOfItems: $numberOfItems, ammountSpent: $ammountSpent, numberOfParticipants: $numberOfParticipants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingWithContextImpl &&
            (identical(other.shopping, shopping) ||
                other.shopping == shopping) &&
            (identical(other.numberOfItems, numberOfItems) ||
                other.numberOfItems == numberOfItems) &&
            (identical(other.ammountSpent, ammountSpent) ||
                other.ammountSpent == ammountSpent) &&
            (identical(other.numberOfParticipants, numberOfParticipants) ||
                other.numberOfParticipants == numberOfParticipants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, shopping, numberOfItems, ammountSpent, numberOfParticipants);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingWithContextImplCopyWith<_$ShoppingWithContextImpl> get copyWith =>
      __$$ShoppingWithContextImplCopyWithImpl<_$ShoppingWithContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingWithContextImplToJson(
      this,
    );
  }
}

abstract class _ShoppingWithContext extends ShoppingWithContext {
  const factory _ShoppingWithContext(
      {required final Shopping shopping,
      required final int numberOfItems,
      required final double ammountSpent,
      required final int numberOfParticipants}) = _$ShoppingWithContextImpl;
  const _ShoppingWithContext._() : super._();

  factory _ShoppingWithContext.fromJson(Map<String, dynamic> json) =
      _$ShoppingWithContextImpl.fromJson;

  @override
  Shopping get shopping;
  @override
  int get numberOfItems;
  @override
  double get ammountSpent;
  @override
  int get numberOfParticipants;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingWithContextImplCopyWith<_$ShoppingWithContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
