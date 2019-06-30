import 'package:json_annotation/json_annotation.dart';
import 'City.dart';


part 'AirModel.g.dart';

@JsonSerializable()

class AirModel {
  int aqi = 0;
  int idx = 0;
  City city = City();
  Map<String, Map<String, double>> iaqi = {};

  AirModel({this.aqi, this.idx, this.city, this.iaqi});

  factory AirModel.fromJson(Map<String, dynamic> json) => _$AirModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirModelToJson(this);
}