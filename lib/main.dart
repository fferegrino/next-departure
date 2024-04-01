import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:next_departure/entities/departure.dart';
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
      home: NextDepartureApp(),
    );
  }
}

class NextDepartureApp extends StatefulWidget {
  const NextDepartureApp({super.key});

  @override
  _NextDepartureAppState createState() => _NextDepartureAppState();
}

class _NextDepartureAppState extends State<NextDepartureApp> {
  late Future<List<Departure>> futureDepartures;

  @override
  void initState() {
    super.initState();
    // This is London Bridge
    futureDepartures = fetchDepartures(lat: 51.507877, lon: -0.087732);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

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
      appBar: AppBar(title: Text(localizations.appTitle)),
      body: futureBuilder,
    );
  }
}
