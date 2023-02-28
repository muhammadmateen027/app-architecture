import 'package:flutter/foundation.dart';
import 'package:helper_options/helper_options.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dtos.g.dart';

class LaunchesListDto {
  LaunchesListDto({required this.launches});

  factory LaunchesListDto.fromJson(List<dynamic> parsedJson) {
    var launches = <LaunchDto>[];
    launches = parsedJson
        .map((i) => LaunchDto.fromJson(i as Map<String, dynamic>))
        .toList();

    return LaunchesListDto(launches: launches);
  }

  final List<LaunchDto> launches;
}

@immutable
@JsonSerializable()
class LaunchDto {
  const LaunchDto({
    this.links,
    this.rocket,
    this.details,
    this.ships,
    this.flightNumber,
    this.name,
    this.firedTime,
    this.datePrecision,
    this.id,
  });

  factory LaunchDto.fromJson(Map<String, dynamic> json) =>
      _$LaunchDtoFromJson(json);

  final LinksDto? links;
  final String? rocket;
  final String? details;
  final List<String>? ships;
  @JsonKey(name: 'flight_number')
  final int? flightNumber;
  final String? name;
  @JsonKey(name: 'static_fire_date_utc')
  final String? firedTime;
  @JsonKey(name: 'date_precision')
  final String? datePrecision;
  final String? id;

  Map<String, dynamic> toJson() => _$LaunchDtoToJson(this);

  Option<DateTime> getFiresTime(String? firedTime) {
    if (firedTime == null) {
      return Option.empty();
    }

    return Option.of(DateTime.parse(firedTime));
  }
}

@immutable
@JsonSerializable()
class LinksDto {
  const LinksDto({
    this.patch,
    this.webcast,
    this.article,
    this.wikipedia,
  });

  factory LinksDto.fromJson(Map<String, dynamic> json) =>
      _$LinksDtoFromJson(json);

  final PatchDto? patch;
  final String? webcast;
  final String? article;
  final String? wikipedia;

  Map<String, dynamic> toJson() => _$LinksDtoToJson(this);
}

@immutable
@JsonSerializable()
class PatchDto {
  const PatchDto({this.small, this.large});

  factory PatchDto.fromJson(Map<String, dynamic> json) =>
      _$PatchDtoFromJson(json);

  final String? small;
  final String? large;

  Map<String, dynamic> toJson() => _$PatchDtoToJson(this);
}
