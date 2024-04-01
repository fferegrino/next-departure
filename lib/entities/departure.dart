class Departure {
  final DateTime time;
  final String platform;
  final String destination;
  final String line;
  final String station;

  Departure({
    required this.station,
    required this.destination,
    required this.time,
    required this.platform,
    required this.line,
  });

  factory Departure.fromJson(Map<String, dynamic> json) {
    return Departure(
      station: json['station'],
      destination: json['towards'],
      line: json['line'],
      platform: json['platform'],
      time: DateTime.parse(json['time']),
    );
  }
}
