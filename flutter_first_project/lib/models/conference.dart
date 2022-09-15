import 'package:json_annotation/json_annotation.dart';

part 'conference.g.dart';

@JsonSerializable()
class Conference {
  Conference();

  late String confPwd;
  late String endTime;
  late String chairman;
  late String startTime;
  late String nickname;
  late String maxTerm;
  late String thirdConfId;
  late String videoEnable;
  late String permanentEnable;
  late String confId;
  late String confName;
  late String ctrlUserId;
  late String ctrlPwd;
  late String startType;
  late String thirdUid;
  late String groupId;
  late String confType;
  late String audioEnable;
  late String recvPwd;
  late String fileprops;
  
  factory Conference.fromJson(Map<String,dynamic> json) => _$ConferenceFromJson(json);
  Map<String, dynamic> toJson() => _$ConferenceToJson(this);
}
