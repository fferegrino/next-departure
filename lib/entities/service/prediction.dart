import 'package:json_annotation/json_annotation.dart';

part 'prediction.g.dart';

@JsonSerializable()
class Prediction {
  final String id;
  final String lineId;
  final String lineName;
  final String destinationName;
  final String stationName;
  final String platformName;
  final String currentLocation;
  final String towards;
  final String expectedArrival;
  final String timeToLive;
  final String modeName;

  Prediction({
    required this.id,
    required this.lineId,
    required this.lineName,
    required this.destinationName,
    required this.stationName,
    required this.platformName,
    required this.currentLocation,
    required this.towards,
    required this.expectedArrival,
    required this.timeToLive,
    required this.modeName,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionToJson(this);
}
