// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HttpResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpResult _$HttpResultFromJson(Map<String, dynamic> json) => HttpResult()
  ..code = json['code'] as String
  ..isSuccess = json['isSuccess'] as bool
  ..data = json['data'] as Map<String, dynamic>;

Map<String, dynamic> _$HttpResultToJson(HttpResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isSuccess': instance.isSuccess,
      'data': instance.data,
    };
