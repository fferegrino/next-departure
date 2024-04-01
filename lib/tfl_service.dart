import 'package:next_departure/entities/departure.dart';
import 'package:next_departure/entities/service/stop_point.dart';
import 'package:next_departure/entities/service/stop_point_response.dart';
import 'package:next_departure/tfl_api.dart';

Future<List<StopPoint>> fetchFilteredStopPoints(
    {required double lat, required double lon, int radius = 500}) async {
  final stopPoints = await fetchStopPoints(lat: lat, lon: lon, radius: radius);

  final filteredStopPoints = stopPoints.stopPoints
      .where((stopPoint) => stopPoint.modes?.isEmpty == false)
      .toList();

  return filteredStopPoints;
}

Future<List<Departure>> fetchDepartures(
    {required double lat, required double lon, int radius = 500}) async {
  final stopPoints =
      await fetchFilteredStopPoints(lat: lat, lon: lon, radius: radius);
  final Map<String, List<String>> stopPointLines = {};
  for (final stopPoint in stopPoints) {
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

  final List<Departure> departures = [];
  for (final entry in stopPointLines.entries) {
    for (final line in entry.value) {
      final predictions =
          await fetchPredictions(line: line, stationId: entry.key);
      for (final prediction in predictions) {
        departures.add(Departure(
          line: line,
          destination: prediction.destinationName,
          station: prediction.stationName,
          platform: prediction.platformName,
          time: DateTime.parse(prediction.expectedArrival),
        ));
      }
    }
  }

  // Sort the departures by time
  departures.sort((a, b) => a.time.compareTo(b.time));

  return departures;
}
