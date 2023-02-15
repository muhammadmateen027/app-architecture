class NullLiftException implements Exception {
  const NullLiftException(this.value);

  final dynamic value;

  @override
  String toString() => 'NullLiftException $value';
}
