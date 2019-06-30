// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlaceResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) {
  return PlaceResponse(
      data: (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Place.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{'data': instance.data};
