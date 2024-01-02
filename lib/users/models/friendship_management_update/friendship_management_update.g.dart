// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship_management_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendshipManagementUpdateImpl _$$FriendshipManagementUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendshipManagementUpdateImpl(
      applicant: User.fromJson(json['applicant'] as Map<String, dynamic>),
      acceptant: User.fromJson(json['acceptant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FriendshipManagementUpdateImplToJson(
        _$FriendshipManagementUpdateImpl instance) =>
    <String, dynamic>{
      'applicant': instance.applicant,
      'acceptant': instance.acceptant,
    };
