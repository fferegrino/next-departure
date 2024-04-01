import 'package:next_departure/entities/service/stop_point.dart';
import 'package:next_departure/entities/service/stop_point_response.dart';
import 'package:next_departure/tfl_api.dart';

Future<StopPointResponse> fetchFilteredStopPoints(
    {required double lat, required double lon, int radius = 500}) async {
  final stopPoints = await fetchStopPoints(lat: lat, lon: lon, radius: radius);

  final filteredStopPoints = stopPoints.stopPoints
      .where((stopPoint) => stopPoint.modes?.isEmpty ?? false)
      .toList();

  final Map<String, List<String>> stopPointLines = {};
  for (final stopPoint in stopPoints.stopPoints) {
    if (stopPoint.lines != null) {
      for (final line in stopPoint.lines!) {
        // Check if line contains a number (if it contains a number we don't want it)
        if (line.id.contains(RegExp(r'\d'))) {
          continue;
        }
        if (stopPointLines.containsKey(stopPoint.naptanId)) {
          stopPointLines[stopPoint.naptanId]!.add(line.id);
        } else {
          stopPointLines[stopPoint.naptanId] = [line.id];
        }
      }
    }
  }

  return StopPointResponse(stopPoints: filteredStopPoints);
}
