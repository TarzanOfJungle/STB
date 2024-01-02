// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_shopping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateShopping _$UpdateShoppingFromJson(Map<String, dynamic> json) {
  return _UpdateShopping.fromJson(json);
}

/// @nodoc
mixin _$UpdateShopping {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get finalized =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'updateDueDateTime')
  bool get updateDue =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'dueDateTime')
  DateTime? get due => throw _privateConstructorUsedError;
  bool get updateDescription => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateShoppingCopyWith<UpdateShopping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateShoppingCopyWith<$Res> {
  factory $UpdateShoppingCopyWith(
          UpdateShopping value, $Res Function(UpdateShopping) then) =
      _$UpdateShoppingCopyWithImpl<$Res, UpdateShopping>;
  @useResult
  $Res call(
      {int id,
      String? name,
      bool? finalized,
      @JsonKey(name: 'updateDueDateTime') bool updateDue,
      @JsonKey(name: 'dueDateTime') DateTime? due,
      bool updateDescription,
      String? description});
}

/// @nodoc
class _$UpdateShoppingCopyWithImpl<$Res, $Val extends UpdateShopping>
    implements $UpdateShoppingCopyWith<$Res> {
  _$UpdateShoppingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? finalized = freezed,
    Object? updateDue = null,
    Object? due = freezed,
    Object? updateDescription = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      finalized: freezed == finalized
          ? _value.finalized
          : finalized // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateDue: null == updateDue
          ? _value.updateDue
          : updateDue // ignore: cast_nullable_to_non_nullable
              as bool,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateDescription: null == updateDescription
          ? _value.updateDescription
          : updateDescription // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateShoppingImplCopyWith<$Res>
    implements $UpdateShoppingCopyWith<$Res> {
  factory _$$UpdateShoppingImplCopyWith(_$UpdateShoppingImpl value,
          $Res Function(_$UpdateShoppingImpl) then) =
      __$$UpdateShoppingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      bool? finalized,
      @JsonKey(name: 'updateDueDateTime') bool updateDue,
      @JsonKey(name: 'dueDateTime') DateTime? due,
      bool updateDescription,
      String? description});
}

/// @nodoc
class __$$UpdateShoppingImplCopyWithImpl<$Res>
    extends _$UpdateShoppingCopyWithImpl<$Res, _$UpdateShoppingImpl>
    implements _$$UpdateShoppingImplCopyWith<$Res> {
  __$$UpdateShoppingImplCopyWithImpl(
      _$UpdateShoppingImpl _value, $Res Function(_$UpdateShoppingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? finalized = freezed,
    Object? updateDue = null,
    Object? due = freezed,
    Object? updateDescription = null,
    Object? description = freezed,
  }) {
    return _then(_$UpdateShoppingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      finalized: freezed == finalized
          ? _value.finalized
          : finalized // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateDue: null == updateDue
          ? _value.updateDue
          : updateDue // ignore: cast_nullable_to_non_nullable
              as bool,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateDescription: null == updateDescription
          ? _value.updateDescription
          : updateDescription // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateShoppingImpl extends _UpdateShopping {
  const _$UpdateShoppingImpl(
      {required this.id,
      this.name,
      this.finalized,
      @JsonKey(name: 'updateDueDateTime') this.updateDue = false,
      @JsonKey(name: 'dueDateTime') this.due,
      this.updateDescription = false,
      this.description})
      : super._();

  factory _$UpdateShoppingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateShoppingImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final bool? finalized;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'updateDueDateTime')
  final bool updateDue;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'dueDateTime')
  final DateTime? due;
  @override
  @JsonKey()
  final bool updateDescription;
  @override
  final String? description;

  @override
  String toString() {
    return 'UpdateShopping(id: $id, name: $name, finalized: $finalized, updateDue: $updateDue, due: $due, updateDescription: $updateDescription, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateShoppingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.finalized, finalized) ||
                other.finalized == finalized) &&
            (identical(other.updateDue, updateDue) ||
                other.updateDue == updateDue) &&
            (identical(other.due, due) || other.due == due) &&
            (identical(other.updateDescription, updateDescription) ||
                other.updateDescription == updateDescription) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, finalized, updateDue,
      due, updateDescription, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateShoppingImplCopyWith<_$UpdateShoppingImpl> get copyWith =>
      __$$UpdateShoppingImplCopyWithImpl<_$UpdateShoppingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateShoppingImplToJson(
      this,
    );
  }
}

abstract class _UpdateShopping extends UpdateShopping {
  const factory _UpdateShopping(
      {required final int id,
      final String? name,
      final bool? finalized,
      @JsonKey(name: 'updateDueDateTime') final bool updateDue,
      @JsonKey(name: 'dueDateTime') final DateTime? due,
      final bool updateDescription,
      final String? description}) = _$UpdateShoppingImpl;
  const _UpdateShopping._() : super._();

  factory _UpdateShopping.fromJson(Map<String, dynamic> json) =
      _$UpdateShoppingImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  bool? get finalized;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'updateDueDateTime')
  bool get updateDue;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'dueDateTime')
  DateTime? get due;
  @override
  bool get updateDescription;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$UpdateShoppingImplCopyWith<_$UpdateShoppingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
