import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:next_departure/entities/departure.dart';
import 'package:next_departure/entities/test_data.dart';

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
      home: NewApp(),
    );
  }
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final List<Departure> departures = departureFromJson(
'[{"destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:14:09", "platform": "Northbound - Platform 1"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:15:40", "platform": "Southbound - Platform 2"}, {"destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:16:10", "platform": "Eastbound - Platform 4"}, {"destination": "Upminster Underground Station", "line": "District", "towards": "Upminster", "time": "2024-03-31T19:16:11", "platform": "Eastbound - Platform 2"}, {"destination": "Richmond Underground Station", "line": "District", "towards": "Richmond", "time": "2024-03-31T19:17:11", "platform": "Westbound - Platform 1"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:17:40", "platform": "Southbound - Platform 2"}, {"destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:18:10", "platform": "Eastbound - Platform 4"}, {"destination": "Hammersmith (H&C Line) Underground Station", "line": "Circle", "towards": "Hammersmith", "time": "2024-03-31T19:18:10", "platform": "Eastbound - Platform 2"}, {"destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:19:09", "platform": "Northbound - Platform 1"}, {"destination": "Willesden Green Underground Station", "line": "Jubilee", "towards": "Willesden Green", "time": "2024-03-31T19:19:10", "platform": "Westbound - Platform 3"}, {"destination": "Stanmore Underground Station", "line": "Jubilee", "towards": "Stanmore", "time": "2024-03-31T19:20:10", "platform": "Westbound - Platform 3"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:20:10", "platform": "Southbound - Platform 2"}, {"destination": "Barking Underground Station", "line": "District", "towards": "Barking", "time": "2024-03-31T19:21:11", "platform": "Eastbound - Platform 2"}, {"destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:22:09", "platform": "Northbound - Platform 1"}, {"destination": "High Barnet Underground Station", "line": "Northern", "towards": "High Barnet via Bank", "time": "2024-03-31T19:23:09", "platform": "Northbound - Platform 1"}, {"destination": "Stanmore Underground Station", "line": "Jubilee", "towards": "Stanmore", "time": "2024-03-31T19:23:10", "platform": "Westbound - Platform 3"}, {"destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:23:10", "platform": "Eastbound - Platform 4"}, {"destination": "Tower Hill Underground Station", "line": "District", "towards": "Tower Hill", "time": "2024-03-31T19:23:11", "platform": "Eastbound - Platform 2"}, {"destination": null, "line": "District", "towards": "Check Front of Train", "time": "2024-03-31T19:24:11", "platform": "Westbound - Platform 1"}, {"destination": "Wembley Park Underground Station", "line": "Jubilee", "towards": "Wembley Park", "time": "2024-03-31T19:25:10", "platform": "Westbound - Platform 3"}, {"destination": "High Barnet Underground Station", "line": "Northern", "towards": "High Barnet via Bank", "time": "2024-03-31T19:26:09", "platform": "Northbound - Platform 1"}, {"destination": "North Greenwich Underground Station", "line": "Jubilee", "towards": "North Greenwich", "time": "2024-03-31T19:27:10", "platform": "Eastbound - Platform 4"}, {"destination": "Stanmore Underground Station", "line": "Jubilee", "towards": "Stanmore", "time": "2024-03-31T19:27:10", "platform": "Westbound - Platform 3"}, {"destination": "Richmond Underground Station", "line": "District", "towards": "Richmond", "time": "2024-03-31T19:27:11", "platform": "Westbound - Platform 1"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:28:10", "platform": "Southbound - Platform 2"}, {"destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:29:10", "platform": "Eastbound - Platform 4"}, {"destination": "Edgware Road (Circle Line) Underground Station", "line": "Circle", "towards": "Edgware Road (Circle)", "time": "2024-03-31T19:29:11", "platform": "Westbound - Platform 1"}, {"destination": "Upminster Underground Station", "line": "District", "towards": "Upminster", "time": "2024-03-31T19:29:11", "platform": "Eastbound - Platform 2"}, {"destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:31:10", "platform": "Northbound - Platform 1"}, {"destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:32:10", "platform": "Eastbound - Platform 4"}, {"destination": "Hammersmith (H&C Line) Underground Station", "line": "Circle", "towards": "Hammersmith", "time": "2024-03-31T19:32:10", "platform": "Eastbound - Platform 2"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:33:10", "platform": "Southbound - Platform 2"}, {"destination": "High Barnet Underground Station", "line": "Northern", "towards": "High Barnet via Bank", "time": "2024-03-31T19:34:10", "platform": "Northbound - Platform 1"}, {"destination": "Barking Underground Station", "line": "District", "towards": "Barking", "time": "2024-03-31T19:34:11", "platform": "Eastbound - Platform 2"}, {"destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:35:10", "platform": "Eastbound - Platform 4"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:35:10", "platform": "Southbound - Platform 2"}, {"destination": "London Bridge Rail Station", "line": "London Overground", "towards": "", "time": "2024-03-31T19:36:00", "platform": "Platform Unknown"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:38:10", "platform": "Southbound - Platform 2"}, {"destination": "Mill Hill East Underground Station", "line": "Northern", "towards": "Mill Hill East via Bank", "time": "2024-03-31T19:39:10", "platform": "Northbound - Platform 1"}, {"destination": "Edgware Road (Circle Line) Underground Station", "line": "Circle", "towards": "Edgware Road (Circle)", "time": "2024-03-31T19:39:11", "platform": "Westbound - Platform 1"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:41:10", "platform": "Southbound - Platform 2"}, {"destination": "Morden Underground Station", "line": "Northern", "towards": "Morden via Bank", "time": "2024-03-31T19:41:10", "platform": "Southbound - Platform 2"}, {"destination": "Edgware Underground Station", "line": "Northern", "towards": "Edgware via Bank", "time": "2024-03-31T19:41:10", "platform": "Northbound - Platform 1"}, {"destination": "Stratford Underground Station", "line": "Jubilee", "towards": "Stratford", "time": "2024-03-31T19:42:11", "platform": "Eastbound - Platform 4"}, {"destination": "Hammersmith (H&C Line) Underground Station", "line": "Circle", "towards": "Hammersmith", "time": "2024-03-31T19:43:10", "platform": "Eastbound - Platform 2"}, {"destination": "London Bridge Rail Station", "line": "London Overground", "towards": "", "time": "2024-03-31T20:06:00", "platform": "Platform Unknown"}, {"destination": "London Bridge Rail Station", "line": "London Overground", "towards": "", "time": "2024-03-31T20:36:00", "platform": "Platform Unknown"}, {"destination": "London Bridge Rail Station", "line": "London Overground", "towards": "", "time": "2024-03-31T21:06:00", "platform": "Platform Unknown"}]'
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle)
        ),
        body: ListView.builder(
          itemCount: departures.length,
          itemBuilder: (context, index) {
            final Departure departure = departures[index];
            return ListTile(
              title: Text(departure.destination),
              subtitle: Text(departure.time.toString()),
            );
          },
        
        ),
      );
  }
}
 