import 'package:json_annotation/json_annotation.dart';

part 'Station.g.dart';

@JsonSerializable()

class Station extends Object with _$StationSerializerMixin {
  final String name;

  Station({this.name});

  factory Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);
}