import 'package:json_annotation/json_annotation.dart';
import 'package:next_departure/entities/service/line.dart';

part 'stop_point.g.dart';

@JsonSerializable()
class StopPoint {
  final String naptanId;
  final String commonName;
  final double lat;
  final double lon;
  final double distance;
  final String stopType;
  final List<String>? modes;
  final List<Line>? lines;

  StopPoint({
    required this.naptanId,
    required this.commonName,
    required this.lat,
    required this.lon,
    required this.distance,
    required this.stopType,
    this.modes,
    this.lines,
  });

  factory StopPoint.fromJson(Map<String, dynamic> json) =>
      _$StopPointFromJson(json);

  Map<String, dynamic> toJson() => _$StopPointToJson(this);
}
