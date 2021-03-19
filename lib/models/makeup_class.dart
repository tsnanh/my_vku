import 'package:json_annotation/json_annotation.dart';

part 'makeup_class.g.dart';

@JsonSerializable()
class MakeupClass {
  @JsonKey(name: "tenlop")
  final String className;
  @JsonKey(name: 'chucdanh')
  final String title;
  @JsonKey(name: 'hodem')
  final String lastName;
  @JsonKey(name: 'ten')
  final String firstName;
  @JsonKey(name: 'ngaybaobu')
  final String dateMakeup;
  @JsonKey(name: 'tenphong')
  final String room;

  const MakeupClass(this.className, this.title, this.lastName, this.firstName,
      this.dateMakeup, this.room);

  factory MakeupClass.fromJson(Map<String, dynamic> json) =>
      _$MakeupClassFromJson(json);
  Map<String, dynamic> toJson() => _$MakeupClassToJson(this);
}
