import 'package:json_annotation/json_annotation.dart';

part 'HttpResult.g.dart';

@JsonSerializable()
class HttpResult {
  HttpResult();

  late String code;
  late bool isSuccess;
  late Map<String,dynamic> data;
  
  factory HttpResult.fromJson(Map<String,dynamic> json) => _$HttpResultFromJson(json);
  Map<String, dynamic> toJson() => _$HttpResultToJson(this);
}
