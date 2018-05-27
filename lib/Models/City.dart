import 'package:json_annotation/json_annotation.dart';

part 'City.g.dart';

@JsonSerializable()

class City extends Object with _$CitySerializerMixin {
  final String name;

  City({this.name});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}