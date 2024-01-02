// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendshipRequestImpl _$$FriendshipRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendshipRequestImpl(
      applicant: User.fromJson(json['applicant'] as Map<String, dynamic>),
      acceptant: User.fromJson(json['acceptant'] as Map<String, dynamic>),
      status: $enumDecode(_$FriendshipRequestStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$FriendshipRequestImplToJson(
        _$FriendshipRequestImpl instance) =>
    <String, dynamic>{
      'applicant': instance.applicant,
      'acceptant': instance.acceptant,
      'status': _$FriendshipRequestStatusEnumMap[instance.status]!,
    };

const _$FriendshipRequestStatusEnumMap = {
  FriendshipRequestStatus.ACCEPTED: 0,
  FriendshipRequestStatus.PENDING: 1,
  FriendshipRequestStatus.REJECTED: 2,
};
