import 'dart:async';

final overrides = Overrides._();

class Overrides {
  Overrides._();

  String? notificationPayload;

  final StreamController<bool> refresher = StreamController();

  void refresh() => refresher.add(true);

  void clear() {
    refresher.add(false);
    notificationPayload = null;
  }
}
