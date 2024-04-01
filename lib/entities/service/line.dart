import 'package:json_annotation/json_annotation.dart';

part 'line.g.dart';

@JsonSerializable()
class Line {
  final String id;
  final String name;
  Line({
    required this.id,
    required this.name,
  });

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);

  Map<String, dynamic> toJson() => _$LineToJson(this);
}
