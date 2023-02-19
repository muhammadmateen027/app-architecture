import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class LaunchItem extends Equatable {
  const LaunchItem({
    required this.image,
    required this.name,
    required this.rockedId,
    required this.id,
  });

  final String image;
  final String name;
  final String rockedId;
  final String id;

  @override
  List<Object?> get props => [id, name, image, rockedId];

  @override
  String toString() {
    return 'Launch{id: $id,name: $name, rockedId: $rockedId, image: $image}';
  }
}
