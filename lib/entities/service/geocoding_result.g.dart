// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoCodingResult _$GeoCodingResultFromJson(Map<String, dynamic> json) =>
    GeoCodingResult(
      displayName: json['display_name'] as String?,
      address:
          GeoCodingAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeoCodingResultToJson(GeoCodingResult instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'address': instance.address,
    };

GeoCodingAddress _$GeoCodingAddressFromJson(Map<String, dynamic> json) =>
    GeoCodingAddress(
      residential: json['residential'] as String?,
      suburb: json['suburb'] as String,
      cityDistrict: json['city_district'] as String?,
      city: json['city'] as String?,
      stateDistrict: json['state_district'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String,
      country: json['country'] as String,
      countryCode: json['country_code'] as String,
    );

Map<String, dynamic> _$GeoCodingAddressToJson(GeoCodingAddress instance) =>
    <String, dynamic>{
      'residential': instance.residential,
      'suburb': instance.suburb,
      'city_district': instance.cityDistrict,
      'city': instance.city,
      'state_district': instance.stateDistrict,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.countryCode,
    };
