import 'package:json_annotation/json_annotation.dart';
import 'package:next_departure/entities/service/stop_point.dart';

part 'stop_point_response.g.dart';

@JsonSerializable()
class StopPointResponse {
  final List<StopPoint> stopPoints;

  StopPointResponse({required this.stopPoints});

  factory StopPointResponse.fromJson(Map<String, dynamic> json) =>
      _$StopPointResponseFromJson(json);
}
