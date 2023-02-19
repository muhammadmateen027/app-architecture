import 'package:flutter/foundation.dart';
import 'package:helper_options/helper_options.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/dto/dtos.dart';
import 'package:stars/provider/extension/string_extension.dart';
import 'package:stars/provider/launches/launch_item.dart';

part 'launch_item_converter.dart';

class LaunchesProvider extends ChangeNotifier {
  LaunchesProvider(this.api);

  final Api api;

  late List<LaunchItem> launches;

  Future<void> init() async {
    launches = [];
    notifyListeners();
    await _getLaunchesList();
  }

  Future<void> refreshLaunches() async {
    launches.clear();
    notifyListeners();
    await _getLaunchesList();
  }

  Future<void> _getLaunchesList() async {
    try {
      final launchesDto = await api.launches();
      launches = const LaunchItemConverter().convert(launchesDto.launches);
      notifyListeners();
    } on Exception {
      notifyListeners();
    }
  }
}

extension LaunchesProviderStatus on LaunchesProvider {
  bool get hasEmptyLaunches => launches.isEmpty;
}
