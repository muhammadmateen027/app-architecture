extension ModelString on String? {
  String get liftNull => this ?? '';
}
