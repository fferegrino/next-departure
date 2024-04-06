import 'dart:convert';

import 'package:next_departure/entities/service/geocoding_result.dart';
import 'package:http/http.dart' as http;

Future<GeoCodingResult> fetchLocation(
    {required double lat, required double lon}) async {
  final response = await http.get(Uri.parse(
      'https://geocode.maps.co/reverse?lat=$lat&lon=$lon&api_key=API_KEY'));

  if (response.statusCode == 200) {
    return GeoCodingResult.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load stop points');
  }
}
