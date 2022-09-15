// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..deptName = json['deptName'] as String
  ..companyID = json['companyID'] as String
  ..phone = json['phone'] as String
  ..stServer = json['stServer'] as List<dynamic>
  ..nickname = json['nickname'] as String
  ..duty = json['duty'] as String
  ..exclusiveConf = json['exclusiveConf'] as String
  ..suid = json['suid'] as num
  ..email = json['email'] as String
  ..account = json['account'] as String
  ..timestamp = json['timestamp'] as String
  ..token = json['token'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'deptName': instance.deptName,
      'companyID': instance.companyID,
      'phone': instance.phone,
      'stServer': instance.stServer,
      'nickname': instance.nickname,
      'duty': instance.duty,
      'exclusiveConf': instance.exclusiveConf,
      'suid': instance.suid,
      'email': instance.email,
      'account': instance.account,
      'timestamp': instance.timestamp,
      'token': instance.token,
    };
