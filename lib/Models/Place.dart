import 'package:json_annotation/json_annotation.dart';
import 'Station.dart';

part 'Place.g.dart';

@JsonSerializable()

class Place extends Object with _$PlaceSerializerMixin {
  final int uid;
  final String aqi;
  final Station station;

  Place({this.uid, this.aqi, this.station});

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}