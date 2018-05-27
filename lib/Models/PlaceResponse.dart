import 'package:json_annotation/json_annotation.dart';
import 'Place.dart';

part 'PlaceResponse.g.dart';

@JsonSerializable()

class PlaceResponse extends Object with _$PlaceResponseSerializerMixin {
  final List<Place> data;

  PlaceResponse({this.data});

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => _$PlaceResponseFromJson(json);
}