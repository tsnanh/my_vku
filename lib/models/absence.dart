import 'package:json_annotation/json_annotation.dart';

part 'absence.g.dart';

@JsonSerializable()
class Absence {
  @JsonKey(name: "tenlop")
  final String className;
  @JsonKey(name: "chucdanh")
  final String title;
  @JsonKey(name: "ten")
  final String firstName;
  @JsonKey(name: 'hodem')
  final String lastName;
  @JsonKey(name: "ngaybaonghi")
  final String date;

  Absence(this.className, this.title, this.firstName, this.lastName, this.date);

  factory Absence.fromJson(Map<String, dynamic> json) =>
      _$AbsenceFromJson(json);
  Map<String, dynamic> toJson() => _$AbsenceToJson(this);
}
