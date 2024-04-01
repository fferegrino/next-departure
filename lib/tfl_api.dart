import 'dart:convert';

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
