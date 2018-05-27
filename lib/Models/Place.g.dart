// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Place.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => new Place(
    uid: json['uid'] as int,
    aqi: json['aqi'] as String,
    station: json['station'] == null
        ? null
        : new Station.fromJson(json['station'] as Map<String, dynamic>));

abstract class _$PlaceSerializerMixin {
  int get uid;
  String get aqi;
  Station get station;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'uid': uid, 'aqi': aqi, 'station': station};
}
