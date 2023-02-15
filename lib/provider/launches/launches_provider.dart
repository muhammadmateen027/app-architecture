import 'package:flutter/foundation.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/dto/dtos.dart';

class LaunchesProvider extends ChangeNotifier {
  LaunchesProvider(this.api) {
    _init();
  }

  final Api api;

  List<LaunchDto>? launches = <LaunchDto>[];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();
    await getListWork();
  }

  Future<void> getListWork() async {
    try {
      launches = await api.launches();
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
