import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stars/navigation/page_names.dart';

@immutable
class PageRoutePath extends Equatable {
  const PageRoutePath.starList()
      : name = starList,
        paths = null,
        isUnknown = false;

  const PageRoutePath.spaceDetail()
      : name = spaceDetail,
        paths = null,
        isUnknown = false;

  const PageRoutePath.unknown()
      : name = null,
        paths = null,
        isUnknown = true;

  final String? name;
  final List<String>? paths;
  final bool isUnknown;

  @override
  String toString() {
    return 'PageRoutePath{name: $name}';
  }

  @override
  List<Object?> get props => [name, isUnknown];
}
