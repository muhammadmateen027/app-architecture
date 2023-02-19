import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/dto/dtos.dart';

class LaunchesProvider extends ChangeNotifier {
  LaunchesProvider(this.api) {
    init();
  }

  final Api api;

  LaunchesList? launches;
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
    log('------------------------');
    try {
      launches = await api.launches();
      log(launches!.launches[1].details.toString());
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
  bool get hasEmptyLaunches => launches == null;

  List<LaunchDto> get launchList {
    const launches = <LaunchDto>[];
    if (!hasEmptyLaunches) {
      return this.launches!.launches;
    }

    return launches;
  }
}
