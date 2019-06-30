import 'package:json_annotation/json_annotation.dart';

part 'City.g.dart';

@JsonSerializable()

class City {
  String name = "";

  City({this.name});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}