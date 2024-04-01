// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prediction _$PredictionFromJson(Map<String, dynamic> json) => Prediction(
      id: json['id'] as String,
      lineId: json['lineId'] as String,
      lineName: json['lineName'] as String,
      destinationName: json['destinationName'] as String,
      stationName: json['stationName'] as String,
      platformName: json['platformName'] as String,
      currentLocation: json['currentLocation'] as String,
      towards: json['towards'] as String,
      expectedArrival: json['expectedArrival'] as String,
      timeToLive: json['timeToLive'] as String,
      modeName: json['modeName'] as String,
    );

Map<String, dynamic> _$PredictionToJson(Prediction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lineId': instance.lineId,
      'lineName': instance.lineName,
      'destinationName': instance.destinationName,
      'stationName': instance.stationName,
      'platformName': instance.platformName,
      'currentLocation': instance.currentLocation,
      'towards': instance.towards,
      'expectedArrival': instance.expectedArrival,
      'timeToLive': instance.timeToLive,
      'modeName': instance.modeName,
    };
