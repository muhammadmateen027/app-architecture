part of 'launches_provider.dart';

@immutable
class LaunchItemConverter {
  const LaunchItemConverter();

  List<LaunchItem> convert(List<LaunchDto> launchDtos) {
    return launchDtos.map((launchDto) => launchDto._toLaunchItem()).toList();
  }
}

extension _LaunchItemX on LaunchDto {
  LaunchItem _toLaunchItem() {
    return LaunchItem(
      image: _buildImage(links!.patch),
      name: name.liftNull,
      rockedId: rocket.liftNull,
      id: id.liftNull,
    );
  }

  String _buildImage(PatchDto? patchDto) {
    return patchDto?.small ?? patchDto?.large ?? '';
  }
}
