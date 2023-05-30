import 'dart:convert';

extension JsonConverterExtension on dynamic {
  String get stringify => jsonEncode(this);
}
