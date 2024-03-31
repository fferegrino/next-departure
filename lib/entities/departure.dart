class Departure {
  final String id;
  final String name;
  final DateTime time;
  final String platform;
  final String destination;
  final String line;

  Departure({required this.id, required this.name, required this.time,
  required this.platform, required this.line,
  required this.destination
  });

  factory Departure.fromJson(Map<String, dynamic> json) {
    return Departure(
      destination: json['towards'],
      line: 'World',
      platform: 'Platform 1',
      id: '1',
      name: 'Name',
      time: DateTime.parse(json['time']),
      // destination: json['destination'],
      // line: json['line'],
      // platform: json['platform'],
      // id: json['id'],
      // name: json['name'],
      // time: json['time'],
    );
  }
}