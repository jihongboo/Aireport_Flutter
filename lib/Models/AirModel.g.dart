// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirModel _$AirModelFromJson(Map<String, dynamic> json) {
  return AirModel(
      aqi: json['aqi'] as int,
      idx: json['idx'] as int,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      iaqi: (json['iaqi'] as Map<String, dynamic>)?.map((k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)
              ?.map((k, e) => MapEntry(k, (e as num)?.toDouble())))));
}

Map<String, dynamic> _$AirModelToJson(AirModel instance) => <String, dynamic>{
      'aqi': instance.aqi,
      'idx': instance.idx,
      'city': instance.city,
      'iaqi': instance.iaqi
    };
