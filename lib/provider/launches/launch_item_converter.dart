part of 'launches_provider.dart';

@immutable
class LaunchItemConverter {
  const LaunchItemConverter();

  List<LaunchItem> convert(List<LaunchDto> launchDtos) {
    return launchDtos.map((launchDto) => launchDto._toLaunchItem()).toList()
      ..sort((a, b) {
        if (!a.dateTime.isPresent && b.dateTime.isPresent) {
          return 0;
        } else if (!a.dateTime.isPresent) {
          return 1;
        } else if (!b.dateTime.isPresent) {
          return -1;
        } else {
          return b.dateTime.value.compareTo(a.dateTime.value);
        }
      });
  }
}

extension _LaunchItemX on LaunchDto {
  LaunchItem _toLaunchItem() {
    return LaunchItem(
      image: _buildImage(links!.patch),
      name: name.liftNull,
      rockedId: rocket.liftNull,
      id: id.liftNull,
      dateTime: getFiresTime(firedTime),
    );
  }

  String _buildImage(PatchDto? patchDto) {
    return patchDto?.small ?? patchDto?.large ?? '';
  }
}
