import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/dto/dtos.dart';
import 'package:stars/provider/launches/launch_item.dart';

part 'launch_item_converter.dart';

class LaunchesProvider extends ChangeNotifier {
  LaunchesProvider(this.api);

  final Api api;

  List<LaunchItem> launches = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();
    await getListWork();
  }

  Future<void> getListWork() async {
    try {
      final launchesDto = await api.launches();
      launches = const LaunchItemConverter().convert(launchesDto.launches);
      _notify();
    } on Exception catch (e) {
      log(e.toString());
      _notify();
    }
  }

  void _notify() {
    _isLoading = false;
    notifyListeners();
  }
}

extension LaunchesProviderStatus on LaunchesProvider {
  bool get hasEmptyLaunches => launches.isEmpty;
}
