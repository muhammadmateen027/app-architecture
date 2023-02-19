import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/dto/dtos.dart';

class LaunchDetailProvider extends ChangeNotifier {
  LaunchDetailProvider(this.api);

  final Api api;

  LaunchDto? launchDetail;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> getLaunch(String id) async {
    _isLoading = true;
    notifyListeners();
    try {
      log('----------------------------');
      launchDetail = await api.getLaunch(id);
      _notify();
    } on Exception {
      _notify();
    }
  }

  void _notify() {
    _isLoading = false;
    notifyListeners();
  }
}
