// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlaceResponse.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    new PlaceResponse(
        data: (json['data'] as List)
            ?.map((e) => e == null
                ? null
                : new Place.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$PlaceResponseSerializerMixin {
  List<Place> get data;
  Map<String, dynamic> toJson() => <String, dynamic>{'data': data};
}
