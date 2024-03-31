// Load a JSON string and convert it to a list of Departure

import 'dart:convert';

import 'package:next_departure/entities/departure.dart';


List<Departure> departureFromJson(String str) =>
    List<Departure>.from(json.decode(str).map((x) => Departure.fromJson(x)));