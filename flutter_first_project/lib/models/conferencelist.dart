import 'package:json_annotation/json_annotation.dart';

part 'conferencelist.g.dart';

@JsonSerializable()
class Conferencelist {
  Conferencelist();

  late String timestamp;
  late List list;
  
  factory Conferencelist.fromJson(Map<String,dynamic> json) => _$ConferencelistFromJson(json);
  Map<String, dynamic> toJson() => _$ConferencelistToJson(this);
}
