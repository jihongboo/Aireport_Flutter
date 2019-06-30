import 'package:json_annotation/json_annotation.dart';

part 'Station.g.dart';

@JsonSerializable()

class Station {
  String name = "";

  Station({this.name});

  factory Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);
  Map<String, dynamic> toJson() => _$StationToJson(this);
}