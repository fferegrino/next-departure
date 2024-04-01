import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:next_departure/entities/departure.dart';
import 'package:timeago/timeago.dart' as timeago;

final DateFormat _timeFormat = DateFormat('HH:mm');

class LineColour {
  final Color background;
  final Color text;

  LineColour({required this.background, required this.text});

  factory LineColour.fromString(String line) {
    switch (line) {
      case 'bakerloo':
        return LineColour(background: Colors.brown, text: Colors.white);
      case 'central':
        return LineColour(background: Colors.red, text: Colors.white);
      case 'circle':
        return LineColour(background: Colors.yellow, text: Colors.black);
      case 'district':
        return LineColour(background: Colors.green, text: Colors.white);
      case 'jubilee':
        return LineColour(background: Colors.grey, text: Colors.white);
      case 'metropolitan':
        return LineColour(background: Colors.purple, text: Colors.white);
      case 'northern':
        return LineColour(background: Colors.black, text: Colors.white);
      case 'london overground':
        return LineColour(background: Colors.orange, text: Colors.black);
      case 'piccadilly':
        return LineColour(background: Colors.blue, text: Colors.white);
      case 'victoria':
        return LineColour(background: Colors.lightBlue, text: Colors.white);
      case 'waterloo & city':
        return LineColour(background: Colors.teal, text: Colors.white);
      default:
        return LineColour(background: Colors.grey, text: Colors.white);
    }
  }
}

class DepartureListItem extends StatelessWidget {
  final Departure departure;

  DepartureListItem({required this.departure});

  @override
  Widget build(BuildContext context) {
    final lineColour = LineColour.fromString(departure.line.toLowerCase());
    // Remove the suffix "Underground Station" or "Rail Statio" from the station name
    final stationName = departure.station
        .replaceAll(RegExp(r' (Underground|Rail) Station$'), '');
    final destinationName = departure.destination
        .replaceAll(RegExp(r' (Underground|Rail) Station$'), '');

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(destinationName, style: TextStyle(fontSize: 20)),
          Text(_timeFormat.format(departure.time.toLocal()),
              style: TextStyle(fontSize: 14)),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              color: lineColour.background,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text("${departure.line} - ${stationName}",
                style: TextStyle(fontSize: 16, color: lineColour.text)),
          ),
          Text(departure.platform, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
