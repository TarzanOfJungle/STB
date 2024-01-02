// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friendship_management_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendshipManagementUpdate _$FriendshipManagementUpdateFromJson(
    Map<String, dynamic> json) {
  return _FriendshipManagementUpdate.fromJson(json);
}

/// @nodoc
mixin _$FriendshipManagementUpdate {
  User get applicant => throw _privateConstructorUsedError;
  User get acceptant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendshipManagementUpdateCopyWith<FriendshipManagementUpdate>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendshipManagementUpdateCopyWith<$Res> {
  factory $FriendshipManagementUpdateCopyWith(FriendshipManagementUpdate value,
          $Res Function(FriendshipManagementUpdate) then) =
      _$FriendshipManagementUpdateCopyWithImpl<$Res,
          FriendshipManagementUpdate>;
  @useResult
  $Res call({User applicant, User acceptant});

  $UserCopyWith<$Res> get applicant;
  $UserCopyWith<$Res> get acceptant;
}

/// @nodoc
class _$FriendshipManagementUpdateCopyWithImpl<$Res,
        $Val extends FriendshipManagementUpdate>
    implements $FriendshipManagementUpdateCopyWith<$Res> {
  _$FriendshipManagementUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicant = null,
    Object? acceptant = null,
  }) {
    return _then(_value.copyWith(
      applicant: null == applicant
          ? _value.applicant
          : applicant // ignore: cast_nullable_to_non_nullable
              as User,
      acceptant: null == acceptant
          ? _value.acceptant
          : acceptant // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get applicant {
    return $UserCopyWith<$Res>(_value.applicant, (value) {
      return _then(_value.copyWith(applicant: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get acceptant {
    return $UserCopyWith<$Res>(_value.acceptant, (value) {
      return _then(_value.copyWith(acceptant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FriendshipManagementUpdateImplCopyWith<$Res>
    implements $FriendshipManagementUpdateCopyWith<$Res> {
  factory _$$FriendshipManagementUpdateImplCopyWith(
          _$FriendshipManagementUpdateImpl value,
          $Res Function(_$FriendshipManagementUpdateImpl) then) =
      __$$FriendshipManagementUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User applicant, User acceptant});

  @override
  $UserCopyWith<$Res> get applicant;
  @override
  $UserCopyWith<$Res> get acceptant;
}

/// @nodoc
class __$$FriendshipManagementUpdateImplCopyWithImpl<$Res>
    extends _$FriendshipManagementUpdateCopyWithImpl<$Res,
        _$FriendshipManagementUpdateImpl>
    implements _$$FriendshipManagementUpdateImplCopyWith<$Res> {
  __$$FriendshipManagementUpdateImplCopyWithImpl(
      _$FriendshipManagementUpdateImpl _value,
      $Res Function(_$FriendshipManagementUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicant = null,
    Object? acceptant = null,
  }) {
    return _then(_$FriendshipManagementUpdateImpl(
      applicant: null == applicant
          ? _value.applicant
          : applicant // ignore: cast_nullable_to_non_nullable
              as User,
      acceptant: null == acceptant
          ? _value.acceptant
          : acceptant // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendshipManagementUpdateImpl extends _FriendshipManagementUpdate {
  const _$FriendshipManagementUpdateImpl(
      {required this.applicant, required this.acceptant})
      : super._();

  factory _$FriendshipManagementUpdateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FriendshipManagementUpdateImplFromJson(json);

  @override
  final User applicant;
  @override
  final User acceptant;

  @override
  String toString() {
    return 'FriendshipManagementUpdate(applicant: $applicant, acceptant: $acceptant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendshipManagementUpdateImpl &&
            (identical(other.applicant, applicant) ||
                other.applicant == applicant) &&
            (identical(other.acceptant, acceptant) ||
                other.acceptant == acceptant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, applicant, acceptant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendshipManagementUpdateImplCopyWith<_$FriendshipManagementUpdateImpl>
      get copyWith => __$$FriendshipManagementUpdateImplCopyWithImpl<
          _$FriendshipManagementUpdateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendshipManagementUpdateImplToJson(
      this,
    );
  }
}

abstract class _FriendshipManagementUpdate extends FriendshipManagementUpdate {
  const factory _FriendshipManagementUpdate(
      {required final User applicant,
      required final User acceptant}) = _$FriendshipManagementUpdateImpl;
  const _FriendshipManagementUpdate._() : super._();

  factory _FriendshipManagementUpdate.fromJson(Map<String, dynamic> json) =
      _$FriendshipManagementUpdateImpl.fromJson;

  @override
  User get applicant;
  @override
  User get acceptant;
  @override
  @JsonKey(ignore: true)
  _$$FriendshipManagementUpdateImplCopyWith<_$FriendshipManagementUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
