import 'package:json_annotation/json_annotation.dart';
import 'Place.dart';

part 'PlaceResponse.g.dart';

@JsonSerializable()

class PlaceResponse {
  List<Place> data = [];

  PlaceResponse({this.data});

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => _$PlaceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);
}