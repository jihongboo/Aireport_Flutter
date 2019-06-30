import 'package:json_annotation/json_annotation.dart';
import 'AirModel.dart';

part 'AirResponse.g.dart';

@JsonSerializable()

class AirResponse {
  final AirModel data;

  AirResponse({this.data});

  factory AirResponse.fromJson(Map<String, dynamic> json) => _$AirResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AirResponseToJson(this);
}



