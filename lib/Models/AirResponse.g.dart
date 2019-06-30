// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirResponse _$AirResponseFromJson(Map<String, dynamic> json) {
  return AirResponse(
      data: json['data'] == null
          ? null
          : AirModel.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AirResponseToJson(AirResponse instance) =>
    <String, dynamic>{'data': instance.data};
