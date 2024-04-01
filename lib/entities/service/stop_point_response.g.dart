// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_point_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopPointResponse _$StopPointResponseFromJson(Map<String, dynamic> json) =>
    StopPointResponse(
      stopPoints: (json['stopPoints'] as List<dynamic>)
          .map((e) => StopPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StopPointResponseToJson(StopPointResponse instance) =>
    <String, dynamic>{
      'stopPoints': instance.stopPoints,
    };
