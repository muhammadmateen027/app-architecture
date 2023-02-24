import 'package:equatable/equatable.dart';
import 'package:helper_options/helper_options.dart';
import 'package:meta/meta.dart';

@immutable
class LaunchItem extends Equatable {
  const LaunchItem({
    required this.image,
    required this.name,
    required this.rockedId,
    required this.id,
    required this.dateTime,
    this.isFavourite = false,
  });

  final String image;
  final String name;
  final String rockedId;
  final String id;
  final Option<DateTime> dateTime;
  final bool isFavourite;

  LaunchItem copyWith({bool? isFavourite}) {
    return LaunchItem(
      id: id,
      image: image,
      name: name,
      rockedId: rockedId,
      dateTime: dateTime,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object?> get props => [id, name, image, rockedId, dateTime, isFavourite];

  @override
  String toString() {
    return 'Launch{id: $id,name: $name, rockedId: $rockedId, image: $image,'
        ' dateTime: $dateTime, isFavourite: $isFavourite}';
  }
}
