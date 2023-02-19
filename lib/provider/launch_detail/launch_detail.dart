import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stars/provider/launches/launch_item.dart';

@immutable
class LaunchDetail extends LaunchItem {
  const LaunchDetail({
    required this.link,
    required this.flightNumber,
    required this.description,
    required super.image,
    required super.name,
    required super.rockedId,
    required super.id,
  });

  final Link link;
  final int flightNumber;
  final String description;

  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'LaunchDetailItem{link: $link, flightNumber: $flightNumber, '
        'description: $description}';
  }
}

class Link extends Equatable {
  const Link({
    required this.youtube,
    required this.wikipedia,
    required this.article,
  });

  final String youtube;
  final String wikipedia;
  final String article;

  @override
  List<Object?> get props => [youtube, wikipedia, article];

  @override
  String toString() {
    return 'Link{youtube: $youtube, wikipedia: $wikipedia, article: $article}';
  }
}
