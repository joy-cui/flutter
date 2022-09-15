import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late String deptName;
  late String companyID;
  late String phone;
  late List stServer;
  late String nickname;
  late String duty;
  late String exclusiveConf;
  late num suid;
  late String email;
  late String account;
  late String timestamp;
  late String token;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
