import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dtos.g.dart';

class LaunchesList {
  LaunchesList({
    required this.launches,
  });

  factory LaunchesList.fromJson(List<dynamic> parsedJson) {
    var launches = <LaunchDto>[];
    launches = parsedJson
        .map((i) => LaunchDto.fromJson(i as Map<String, dynamic>))
        .toList();

    return LaunchesList(launches: launches);
  }

  final List<LaunchDto> launches;
}

@immutable
@JsonSerializable()
class LaunchDto extends Equatable {
  const LaunchDto({
    this.links,
    this.rocket,
    this.details,
    this.ships,
    this.flightNumber,
    this.name,
    this.dateLocal,
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
  @JsonKey(name: 'date_local')
  final String? dateLocal;
  @JsonKey(name: 'date_precision')
  final String? datePrecision;
  final String? id;

  Map<String, dynamic> toJson() => _$LaunchDtoToJson(this);

  @override
  List<Object?> get props => [
        links,
        rocket,
        details,
        ships,
        flightNumber,
        name,
        dateLocal,
        datePrecision,
        id,
      ];
}

@immutable
@JsonSerializable()
class LinksDto extends Equatable {
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

  @override
  List<Object?> get props => [patch, webcast, article, wikipedia];
}

@immutable
@JsonSerializable()
class PatchDto extends Equatable {
  const PatchDto({this.small, this.large});

  factory PatchDto.fromJson(Map<String, dynamic> json) =>
      _$PatchDtoFromJson(json);

  final String? small;
  final String? large;

  Map<String, dynamic> toJson() => _$PatchDtoToJson(this);

  @override
  List<Object?> get props => [small, large];
}
