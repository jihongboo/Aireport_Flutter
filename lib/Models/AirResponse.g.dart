// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirResponse.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

AirResponse _$AirResponseFromJson(Map<String, dynamic> json) => new AirResponse(
    data: json['data'] == null
        ? null
        : new AirModel.fromJson(json['data'] as Map<String, dynamic>));

abstract class _$AirResponseSerializerMixin {
  AirModel get data;
  Map<String, dynamic> toJson() => <String, dynamic>{'data': data};
}
