// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirModel.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

AirModel _$AirModelFromJson(Map<String, dynamic> json) => new AirModel(
    aqi: json['aqi'] as int,
    idx: json['idx'] as int,
    city: json['city'] == null
        ? null
        : new City.fromJson(json['city'] as Map<String, dynamic>));

abstract class _$AirModelSerializerMixin {
  int get aqi;
  int get idx;
  City get city;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'aqi': aqi, 'idx': idx, 'city': city};
}
