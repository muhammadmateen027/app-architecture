part of 'launch_detail_provider.dart';

@immutable
class LaunchDetailConverter {
  const LaunchDetailConverter();

  LaunchDetail convert(LaunchDto launchDto) => launchDto._toLaunchItem();
}

extension _LaunchDetailX on LaunchDto {
  LaunchDetail _toLaunchItem() {
    return LaunchDetail(
      image: _buildImage(links!.patch),
      name: name.liftNull,
      rockedId: rocket.liftNull,
      id: id.liftNull,
      description: details.liftNull,
      flightNumber: flightNumber ?? 0,
      link: Link(
        youtube: links!.webcast.liftNull,
        wikipedia: links!.wikipedia.liftNull,
        article: links!.article.liftNull,
      ),
    );
  }

  String _buildImage(PatchDto? patchDto) {
    return patchDto?.large ?? patchDto?.small ?? '';
  }
}
