import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:next_departure/entities/departure.dart';
import 'package:next_departure/entities/service/stop_point.dart';
import 'package:next_departure/entities/service/stop_point_response.dart';
import 'package:next_departure/entities/test_data.dart';
import 'package:next_departure/tfl_api.dart';
import 'package:next_departure/tfl_service.dart';
import 'package:next_departure/ui/departure_list_item.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: TestApp(),
    );
  }
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  late Future<List<Departure>> futureDepartures;

  @override
  void initState() {
    super.initState();
    // This is London Bridge
    futureDepartures = fetchDepartures(lat: 51.507877, lon: -0.087732);
  }

  @override
  Widget build(BuildContext context) {
    final FutureBuilder<List<Departure>> futureBuilder =
        FutureBuilder<List<Departure>>(
      future: futureDepartures,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final Departure departure = snapshot.data![index];
              return DepartureListItem(departure: departure);
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text('Test App')),
      body: futureBuilder,
    );
  }
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final List<Departure> departures = departureFromJson(
        '[{"station": "London Bridge Underground Station", "destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:14:09", "platform": "Northbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:15:40", "platform": "Southbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:16:10", "platform": "Eastbound - Platform 4"}, {"station": "Monument Underground Station", "destination": "Upminster Underground Station", "line": "District", "towards": "Upminster", "time": "2024-03-31T19:16:11", "platform": "Eastbound - Platform 2"}, {"station": "Monument Underground Station", "destination": "Richmond Underground Station", "line": "District", "towards": "Richmond", "time": "2024-03-31T19:17:11", "platform": "Westbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:17:40", "platform": "Southbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:18:10", "platform": "Eastbound - Platform 4"}, {"station": "Monument Underground Station", "destination": "Hammersmith (H&C Line) Underground Station", "line": "Circle", "towards": "Hammersmith", "time": "2024-03-31T19:18:10", "platform": "Eastbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:19:09", "platform": "Northbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Willesden Green Underground Station", "line": "Jubilee", "towards": "Willesden Green", "time": "2024-03-31T19:19:10", "platform": "Westbound - Platform 3"}, {"station": "London Bridge Underground Station", "destination": "Stanmore Underground Station", "line": "Jubilee", "towards": "Stanmore", "time": "2024-03-31T19:20:10", "platform": "Westbound - Platform 3"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:20:10", "platform": "Southbound - Platform 2"}, {"station": "Monument Underground Station", "destination": "Barking Underground Station", "line": "District", "towards": "Barking", "time": "2024-03-31T19:21:11", "platform": "Eastbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:22:09", "platform": "Northbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "High Barnet Underground Station", "line": "Northern", "towards": "High Barnet via Bank", "time": "2024-03-31T19:23:09", "platform": "Northbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Stanmore Underground Station", "line": "Jubilee", "towards": "Stanmore", "time": "2024-03-31T19:23:10", "platform": "Westbound - Platform 3"}, {"station": "London Bridge Underground Station", "destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:23:10", "platform": "Eastbound - Platform 4"}, {"station": "Monument Underground Station", "destination": "Tower Hill Underground Station", "line": "District", "towards": "Tower Hill", "time": "2024-03-31T19:23:11", "platform": "Eastbound - Platform 2"}, {"station": "Monument Underground Station", "destination": null, "line": "District", "towards": "Check Front of Train", "time": "2024-03-31T19:24:11", "platform": "Westbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Wembley Park Underground Station", "line": "Jubilee", "towards": "Wembley Park", "time": "2024-03-31T19:25:10", "platform": "Westbound - Platform 3"}, {"station": "London Bridge Underground Station", "destination": "High Barnet Underground Station", "line": "Northern", "towards": "High Barnet via Bank", "time": "2024-03-31T19:26:09", "platform": "Northbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "North Greenwich Underground Station", "line": "Jubilee", "towards": "North Greenwich", "time": "2024-03-31T19:27:10", "platform": "Eastbound - Platform 4"}, {"station": "London Bridge Underground Station", "destination": "Stanmore Underground Station", "line": "Jubilee", "towards": "Stanmore", "time": "2024-03-31T19:27:10", "platform": "Westbound - Platform 3"}, {"station": "Monument Underground Station", "destination": "Richmond Underground Station", "line": "District", "towards": "Richmond", "time": "2024-03-31T19:27:11", "platform": "Westbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:28:10", "platform": "Southbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:29:10", "platform": "Eastbound - Platform 4"}, {"station": "Monument Underground Station", "destination": "Edgware Road (Circle Line) Underground Station", "line": "Circle", "towards": "Edgware Road (Circle)", "time": "2024-03-31T19:29:11", "platform": "Westbound - Platform 1"}, {"station": "Monument Underground Station", "destination": "Upminster Underground Station", "line": "District", "towards": "Upminster", "time": "2024-03-31T19:29:11", "platform": "Eastbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:31:10", "platform": "Northbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:32:10", "platform": "Eastbound - Platform 4"}, {"station": "Monument Underground Station", "destination": "Hammersmith (H&C Line) Underground Station", "line": "Circle", "towards": "Hammersmith", "time": "2024-03-31T19:32:10", "platform": "Eastbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:33:10", "platform": "Southbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "High Barnet Underground Station", "line": "Northern", "towards": "High Barnet via Bank", "time": "2024-03-31T19:34:10", "platform": "Northbound - Platform 1"}, {"station": "Monument Underground Station", "destination": "Barking Underground Station", "line": "District", "towards": "Barking", "time": "2024-03-31T19:34:11", "platform": "Eastbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:35:10", "platform": "Eastbound - Platform 4"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:35:10", "platform": "Southbound - Platform 2"}, {"station": "London Bridge Rail Station", "destination": "London Bridge Rail Station", "line": "London Overground", "towards": "", "time": "2024-03-31T19:36:00", "platform": "Platform Unknown"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:38:10", "platform": "Southbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Mill Hill East Underground Station", "line": "Northern", "towards": "Mill Hill East via Bank", "time": "2024-03-31T19:39:10", "platform": "Northbound - Platform 1"}, {"station": "Monument Underground Station", "destination": "Edgware Road (Circle Line) Underground Station", "line": "Circle", "towards": "Edgware Road (Circle)", "time": "2024-03-31T19:39:11", "platform": "Westbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:41:10", "platform": "Southbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:41:10", "platform": "Southbound - Platform 2"}, {"station": "London Bridge Underground Station", "destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:41:10", "platform": "Northbound - Platform 1"}, {"station": "London Bridge Underground Station", "destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:42:11", "platform": "Eastbound - Platform 4"}, {"station": "Monument Underground Station", "destination": "Hammersmith (H&C Line) Underground Station", "line": "Circle", "towards": "Hammersmith", "time": "2024-03-31T19:43:10", "platform": "Eastbound - Platform 2"}, {"station": "London Bridge Rail Station", "destination": "London Bridge Rail Station", "line": "London Overground", "towards": "", "time": "2024-03-31T20:06:00", "platform": "Platform Unknown"}, {"station": "London Bridge Rail Station", "destination": "London Bridge Rail Station", "line": "London Overground", "towards": "", "time": "2024-03-31T20:36:00", "platform": "Platform Unknown"}, {"station": "London Bridge Rail Station", "destination": "London Bridge Rail Station", "line": "London Overground", "towards": "", "time": "2024-03-31T21:06:00", "platform": "Platform Unknown"}]');

    return Scaffold(
      appBar: AppBar(title: Text(localizations.appTitle)),
      body: ListView.builder(
        itemCount: departures.length,
        itemBuilder: (context, index) {
          final Departure departure = departures[index];
          return DepartureListItem(departure: departure);
        },
      ),
    );
  }
}
