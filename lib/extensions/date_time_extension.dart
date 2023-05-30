extension DateTimeExension on DateTime {
  bool isSameDay(final DateTime other) =>
      day == other.day && month == other.month && year == other.year;

  bool isLaterOrEqualDay(final DateTime other) =>
      isSameDay(other) || isAfter(other);

  Duration difference(DateTime dateTime) => this.difference(dateTime);

  DateTime get firstDayOfMonth => DateTime(year, month);

  DateTime get firstDayOfNextMonth => DateTime(year, month + 1);

  DateTime get secondDayOfNextMonth => DateTime(year, month + 1, 2);

  DateTime get lastDayOfPreviousMonth => DateTime(year, month, 0);
}
