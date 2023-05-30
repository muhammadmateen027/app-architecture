extension IntExtension on int? {
  int get valueOrZero => this ?? 0;
}
