import 'package:json_annotation/json_annotation.dart';

part 'stop_point.g.dart';

@JsonSerializable()
class StopPoint {
  final String naptanId;
  final String commonName;
  final double lat;
  final double lon;
  final double distance;
  final String stopType;

  StopPoint({
    required this.naptanId,
    required this.commonName,
    required this.lat,
    required this.lon,
    required this.distance,
    required this.stopType,
  });

  factory StopPoint.fromJson(Map<String, dynamic> json) =>
      _$StopPointFromJson(json);

  Map<String, dynamic> toJson() => _$StopPointToJson(this);
}
