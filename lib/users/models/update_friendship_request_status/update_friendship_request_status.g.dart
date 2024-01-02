// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_friendship_request_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateFriendshipRequestStatusImpl
    _$$UpdateFriendshipRequestStatusImplFromJson(Map<String, dynamic> json) =>
        _$UpdateFriendshipRequestStatusImpl(
          applicantId: json['applicantId'] as int,
          acceptantId: json['acceptantId'] as int,
          accept: json['accept'] as bool,
        );

Map<String, dynamic> _$$UpdateFriendshipRequestStatusImplToJson(
        _$UpdateFriendshipRequestStatusImpl instance) =>
    <String, dynamic>{
      'applicantId': instance.applicantId,
      'acceptantId': instance.acceptantId,
      'accept': instance.accept,
    };
