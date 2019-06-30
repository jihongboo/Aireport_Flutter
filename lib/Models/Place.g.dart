// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
      uid: json['uid'] as int,
      aqi: json['aqi'] as String,
      station: json['station'] == null
          ? null
          : Station.fromJson(json['station'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'uid': instance.uid,
      'aqi': instance.aqi,
      'station': instance.station
    };
