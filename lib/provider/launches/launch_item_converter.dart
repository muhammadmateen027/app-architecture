part of 'launches_provider.dart';

@immutable
class LaunchItemConverter {
  const LaunchItemConverter();

  List<LaunchItem> convert(List<LaunchDto> launchDtos) {
    return launchDtos.map((launchDto) => launchDto.toLaunchItem()).toList();
  }
}

extension LaunchItemX on LaunchDto {
  LaunchItem toLaunchItem() {
    return LaunchItem(
      image: _buildImage(links!.patch),
      name: name ?? '',
      description: details ?? '',
      rockedId: rocket ?? '',
      id: id ?? '',
    );
  }

  String _buildImage(PatchDto? patchDto) {
    return patchDto?.small ?? patchDto?.large ?? '';
  }
}
