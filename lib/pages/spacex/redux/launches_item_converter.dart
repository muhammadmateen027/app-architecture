import 'package:flutter/material.dart';
import 'package:stars/api/dto/dtos.dart';
import 'package:stars/extensions/extensions.dart';
import 'package:stars/pages/pages.dart';

@immutable
class LaunchItemConverter {
  const LaunchItemConverter();

  Set<LaunchItem> convert(List<LaunchDto> launchDtos) {
    return launchDtos.map((launchDto) => launchDto._toLaunchItem()).toSet();
  }

  List<LaunchItem> setFavourite(List<LaunchItem> launches, String id) {
    return [
      for (final item in launches)
        if (item.id == id)
          LaunchItem(
            image: item.image,
            name: item.name,
            rockedId: item.rockedId,
            id: item.id,
            dateTime: item.dateTime,
            isFavourite: !item.isFavourite,
          )
        else
          item,
    ];
  }
}

extension _LaunchItemX on LaunchDto {
  LaunchItem _toLaunchItem() {
    return LaunchItem(
      image: _buildImage(links!.patch),
      name: name.liftNonNull,
      rockedId: rocket.liftNonNull,
      id: id.liftNonNull,
      dateTime: getFiresTime(firedTime),
    );
  }

  String _buildImage(PatchDto? patchDto) {
    return patchDto?.small ?? patchDto?.large ?? '';
  }
}
