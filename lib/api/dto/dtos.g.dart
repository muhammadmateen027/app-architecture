// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchDto _$LaunchDtoFromJson(Map<String, dynamic> json) => LaunchDto(
      links: json['links'] == null
          ? null
          : LinksDto.fromJson(json['links'] as Map<String, dynamic>),
      rocket: json['rocket'] as String?,
      details: json['details'] as String?,
      ships:
          (json['ships'] as List<dynamic>?)?.map((e) => e as String).toList(),
      flightNumber: json['flight_number'] as int?,
      name: json['name'] as String?,
      dateLocal: json['date_local'] as String?,
      datePrecision: json['date_precision'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LaunchDtoToJson(LaunchDto instance) => <String, dynamic>{
      'links': instance.links,
      'rocket': instance.rocket,
      'details': instance.details,
      'ships': instance.ships,
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_local': instance.dateLocal,
      'date_precision': instance.datePrecision,
      'id': instance.id,
    };

LinksDto _$LinksDtoFromJson(Map<String, dynamic> json) => LinksDto(
      patch: json['patch'] == null
          ? null
          : PatchDto.fromJson(json['patch'] as Map<String, dynamic>),
      webcast: json['webcast'] as String?,
      article: json['article'] as String?,
      wikipedia: json['wikipedia'] as String?,
    );

Map<String, dynamic> _$LinksDtoToJson(LinksDto instance) => <String, dynamic>{
      'patch': instance.patch,
      'webcast': instance.webcast,
      'article': instance.article,
      'wikipedia': instance.wikipedia,
    };

PatchDto _$PatchDtoFromJson(Map<String, dynamic> json) => PatchDto(
      small: json['small'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$PatchDtoToJson(PatchDto instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };
