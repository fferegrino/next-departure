import 'package:json_annotation/json_annotation.dart';

part 'geocoding_result.g.dart';

@JsonSerializable()
class GeoCodingResult {
  @JsonKey(name: 'display_name')
  final String? displayName;
  final GeoCodingAddress address;

  GeoCodingResult({
    required this.displayName,
    required this.address,
  });

  factory GeoCodingResult.fromJson(Map<String, dynamic> json) =>
      _$GeoCodingResultFromJson(json);

  Map<String, dynamic> toJson() => _$GeoCodingResultToJson(this);
}

@JsonSerializable()
class GeoCodingAddress {
  final String? residential;
  final String suburb;
  @JsonKey(name: 'city_district')
  final String? cityDistrict;
  final String? city;
  @JsonKey(name: 'state_district')
  final String? stateDistrict;
  final String? state;
  final String postcode;
  final String country;
  @JsonKey(name: 'country_code')
  final String countryCode;

  GeoCodingAddress({
    required this.residential,
    required this.suburb,
    required this.cityDistrict,
    required this.city,
    required this.stateDistrict,
    required this.state,
    required this.postcode,
    required this.country,
    required this.countryCode,
  });

  factory GeoCodingAddress.fromJson(Map<String, dynamic> json) =>
      _$GeoCodingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$GeoCodingAddressToJson(this);
}
