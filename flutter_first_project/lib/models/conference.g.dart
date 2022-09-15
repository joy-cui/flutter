// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conference _$ConferenceFromJson(Map<String, dynamic> json) => Conference()
  ..confPwd = json['confPwd'] as String
  ..endTime = json['endTime'] as String
  ..chairman = json['chairman'] as String
  ..startTime = json['startTime'] as String
  ..nickname = json['nickname'] as String
  ..maxTerm = json['maxTerm'] as String
  ..thirdConfId = json['thirdConfId'] as String
  ..videoEnable = json['videoEnable'] as String
  ..permanentEnable = json['permanentEnable'] as String
  ..confId = json['confId'] as String
  ..confName = json['confName'] as String
  ..ctrlUserId = json['ctrlUserId'] as String
  ..ctrlPwd = json['ctrlPwd'] as String
  ..startType = json['startType'] as String
  ..thirdUid = json['thirdUid'] as String
  ..groupId = json['groupId'] as String
  ..confType = json['confType'] as String
  ..audioEnable = json['audioEnable'] as String
  ..recvPwd = json['recvPwd'] as String
  ..fileprops = json['fileprops'] as String;

Map<String, dynamic> _$ConferenceToJson(Conference instance) =>
    <String, dynamic>{
      'confPwd': instance.confPwd,
      'endTime': instance.endTime,
      'chairman': instance.chairman,
      'startTime': instance.startTime,
      'nickname': instance.nickname,
      'maxTerm': instance.maxTerm,
      'thirdConfId': instance.thirdConfId,
      'videoEnable': instance.videoEnable,
      'permanentEnable': instance.permanentEnable,
      'confId': instance.confId,
      'confName': instance.confName,
      'ctrlUserId': instance.ctrlUserId,
      'ctrlPwd': instance.ctrlPwd,
      'startType': instance.startType,
      'thirdUid': instance.thirdUid,
      'groupId': instance.groupId,
      'confType': instance.confType,
      'audioEnable': instance.audioEnable,
      'recvPwd': instance.recvPwd,
      'fileprops': instance.fileprops,
    };
