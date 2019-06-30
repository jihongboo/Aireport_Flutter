import 'package:json_annotation/json_annotation.dart';
import 'Station.dart';

part 'Place.g.dart';

@JsonSerializable()

class Place {
  int uid = 0;
  String aqi = "";
  Station station = Station();

  Place({this.uid, this.aqi, this.station});

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}