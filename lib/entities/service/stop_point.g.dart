// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopPoint _$StopPointFromJson(Map<String, dynamic> json) => StopPoint(
      naptanId: json['naptanId'] as String,
      commonName: json['commonName'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      stopType: json['stopType'] as String,
      modes:
          (json['modes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lines: (json['lines'] as List<dynamic>?)
          ?.map((e) => Line.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StopPointToJson(StopPoint instance) => <String, dynamic>{
      'naptanId': instance.naptanId,
      'commonName': instance.commonName,
      'lat': instance.lat,
      'lon': instance.lon,
      'distance': instance.distance,
      'stopType': instance.stopType,
      'modes': instance.modes,
      'lines': instance.lines,
    };
