import 'dart:convert';

import 'package:next_departure/entities/service/prediction.dart';
import 'package:next_departure/entities/service/stop_point_response.dart';
import 'package:http/http.dart' as http;

Future<StopPointResponse> fetchStopPoints(
    {required double lat, required double lon, int radius = 500}) async {
  const stopTypes = 'NaptanRailStation,NaptanMetroStation';
  final response = await http.get(Uri.parse(
      'https://api.tfl.gov.uk/StopPoint?stopTypes=$stopTypes&lat=$lat&lon=$lon&radius=$radius'));

  if (response.statusCode == 200) {
    return StopPointResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load stop points');
  }
}

Future<List<Prediction>> fetchPredictions(
    {required String line, required String stationId}) async {
  final response = await http
      .get(Uri.parse('https://api.tfl.gov.uk/Line/$line/Arrivals/$stationId'));

  if (response.statusCode == 200) {
    final Iterable list = jsonDecode(response.body);
    // final predictions = jsonDecode(response.body) as List<Map<String, dynamic>>;
    return list.map((prediction) {
      return Prediction.fromJson(prediction as Map<String, dynamic>);
    }).toList();
  } else {
    throw Exception('Failed to load prediction');
  }
}
