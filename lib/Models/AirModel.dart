import 'package:json_annotation/json_annotation.dart';
import 'City.dart';


part 'AirModel.g.dart';

@JsonSerializable()

class AirModel extends Object with _$AirModelSerializerMixin {
  final int aqi;
  final int idx;
  final City city;

  AirModel({this.aqi, this.idx, this.city});

  factory AirModel.fromJson(Map<String, dynamic> json) => _$AirModelFromJson(json);
}