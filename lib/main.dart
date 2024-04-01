import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:next_departure/entities/departure.dart';
import 'package:next_departure/tfl_service.dart';
import 'package:next_departure/ui/departure_list_item.dart';
import 'package:geolocator/geolocator.dart';

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
  late Future<Position> futurePosition;

  @override
  void initState() {
    super.initState();
    // This is London Bridge
    futurePosition = _determinePosition();
    futurePosition
        .then((value) => {
              setState(() {
                futureDepartures =
                    fetchDepartures(lat: value.latitude, lon: value.longitude);
              })
            })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.locationError),
        ),
      );
    });
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
      appBar: AppBar(
        title: Text(localizations.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                futureDepartures =
                    fetchDepartures(lat: 51.507877, lon: -0.087732);
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              _determinePosition().then((position) {
                setState(() {
                  futureDepartures = fetchDepartures(
                      lat: position.latitude, lon: position.longitude);
                });
              }).catchError((error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localizations.locationError),
                  ),
                );
              });
            },
          ),
        ],
      ),
      body: futureBuilder,
    );
  }
}

Future<Position> _determinePosition() async {
  // Check if location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled return an error message
    return Future.error('Location services are disabled.');
  }

  // Check location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // If permissions are granted, return the current location
  return await Geolocator.getCurrentPosition();
}
