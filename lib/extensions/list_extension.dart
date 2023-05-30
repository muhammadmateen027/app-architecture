extension ListExtension<T> on List<T> {
  bool hasExact(final int value) => length == value;

  T? elementAtOrNull(final int index) {
    try {
      return elementAt(index);
      // ignore: avoid_catching_errors
    } on RangeError {
      return null;
    }
  }
}
