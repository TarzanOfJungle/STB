// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Shopping _$ShoppingFromJson(Map<String, dynamic> json) {
  return _Shopping.fromJson(json);
}

/// @nodoc
mixin _$Shopping {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get creatorId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get finalized => throw _privateConstructorUsedError;
  @JsonKey(name: 'dueDateTime')
  DateTime? get due => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  DateTime? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingCopyWith<Shopping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCopyWith<$Res> {
  factory $ShoppingCopyWith(Shopping value, $Res Function(Shopping) then) =
      _$ShoppingCopyWithImpl<$Res, Shopping>;
  @useResult
  $Res call(
      {int id,
      String name,
      int creatorId,
      String? description,
      bool finalized,
      @JsonKey(name: 'dueDateTime') DateTime? due,
      DateTime? created,
      DateTime? updated});
}

/// @nodoc
class _$ShoppingCopyWithImpl<$Res, $Val extends Shopping>
    implements $ShoppingCopyWith<$Res> {
  _$ShoppingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? creatorId = null,
    Object? description = freezed,
    Object? finalized = null,
    Object? due = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      finalized: null == finalized
          ? _value.finalized
          : finalized // ignore: cast_nullable_to_non_nullable
              as bool,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingImplCopyWith<$Res>
    implements $ShoppingCopyWith<$Res> {
  factory _$$ShoppingImplCopyWith(
          _$ShoppingImpl value, $Res Function(_$ShoppingImpl) then) =
      __$$ShoppingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int creatorId,
      String? description,
      bool finalized,
      @JsonKey(name: 'dueDateTime') DateTime? due,
      DateTime? created,
      DateTime? updated});
}

/// @nodoc
class __$$ShoppingImplCopyWithImpl<$Res>
    extends _$ShoppingCopyWithImpl<$Res, _$ShoppingImpl>
    implements _$$ShoppingImplCopyWith<$Res> {
  __$$ShoppingImplCopyWithImpl(
      _$ShoppingImpl _value, $Res Function(_$ShoppingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? creatorId = null,
    Object? description = freezed,
    Object? finalized = null,
    Object? due = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_$ShoppingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      finalized: null == finalized
          ? _value.finalized
          : finalized // ignore: cast_nullable_to_non_nullable
              as bool,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingImpl extends _Shopping {
  const _$ShoppingImpl(
      {required this.id,
      required this.name,
      required this.creatorId,
      this.description,
      required this.finalized,
      @JsonKey(name: 'dueDateTime') this.due,
      this.created,
      this.updated})
      : super._();

  factory _$ShoppingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int creatorId;
  @override
  final String? description;
  @override
  final bool finalized;
  @override
  @JsonKey(name: 'dueDateTime')
  final DateTime? due;
  @override
  final DateTime? created;
  @override
  final DateTime? updated;

  @override
  String toString() {
    return 'Shopping(id: $id, name: $name, creatorId: $creatorId, description: $description, finalized: $finalized, due: $due, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.finalized, finalized) ||
                other.finalized == finalized) &&
            (identical(other.due, due) || other.due == due) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, creatorId, description,
      finalized, due, created, updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingImplCopyWith<_$ShoppingImpl> get copyWith =>
      __$$ShoppingImplCopyWithImpl<_$ShoppingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingImplToJson(
      this,
    );
  }
}

abstract class _Shopping extends Shopping {
  const factory _Shopping(
      {required final int id,
      required final String name,
      required final int creatorId,
      final String? description,
      required final bool finalized,
      @JsonKey(name: 'dueDateTime') final DateTime? due,
      final DateTime? created,
      final DateTime? updated}) = _$ShoppingImpl;
  const _Shopping._() : super._();

  factory _Shopping.fromJson(Map<String, dynamic> json) =
      _$ShoppingImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get creatorId;
  @override
  String? get description;
  @override
  bool get finalized;
  @override
  @JsonKey(name: 'dueDateTime')
  DateTime? get due;
  @override
  DateTime? get created;
  @override
  DateTime? get updated;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingImplCopyWith<_$ShoppingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
