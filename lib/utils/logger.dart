import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

const logger = _EventLogger();

class _EventLogger {
  const _EventLogger();

  String get _resetColorCode => '\u001b[0m';

  void i(
    String text, {
    String? tag,
    bool showTime = false,
    StackTrace? stackTrace,
  }) {
    _log(
      text,
      _InfoLogStatus(),
      stackTrace: stackTrace,
      showTime: showTime,
      tag: tag,
    );
  }

  void e(
    String text, {
    String? tag,
    bool showTime = false,
    StackTrace? stackTrace,
    Object? error,
  }) {
    _log(
      text,
      _ErrorLogStatus(),
      stackTrace: stackTrace,
      showTime: showTime,
      tag: tag,
    );
  }

  void s(
    String text, {
    String? tag,
    bool showTime = false,
    StackTrace? stackTrace,
  }) {
    _log(
      text,
      _SuccessLogStatus(),
      stackTrace: stackTrace,
      showTime: showTime,
      tag: tag,
    );
  }

  void d(
    String text, {
    String? tag,
    bool showTime = false,
    StackTrace? stackTrace,
  }) {
    _log(
      text,
      _DebugLogStatus(),
      stackTrace: stackTrace,
      showTime: showTime,
      tag: tag,
    );
  }

  void _log(
    dynamic text,
    _LogStatus status, {
    String? tag,
    bool showTime = false,
    StackTrace? stackTrace,
    Object? error,
  }) {
    var time = showTime ? DateTime.now().toString() : '';
    if (time.isNotEmpty) {
      time = '[$time]';
    }

    final msg = '${status.color}$time $text$_resetColorCode';
    final coloredTag = '${status.color}[${status.emoji}][${tag ?? status.tag}]'
        '$_resetColorCode';

    if (kDebugMode) {
      print('$coloredTag$msg');
    } else {
      dev.log(
        msg,
        name: tag ?? status.tag,
        stackTrace: stackTrace,
        error: error,
      );
    }
  }
}

class _LogStatus {
  _LogStatus(this.tag, this.emoji, this.color);

  final String tag;
  final String emoji;
  final String color;
}

class _InfoLogStatus extends _LogStatus {
  _InfoLogStatus() : super('INFO', 'ℹ️', '\u001b[34m');
}

class _SuccessLogStatus extends _LogStatus {
  _SuccessLogStatus() : super('SUCCESS', '✅', '\u001b[32m');
}

class _ErrorLogStatus extends _LogStatus {
  _ErrorLogStatus() : super('ERROR', '🥵', '\u001b[31m');
}

class _DebugLogStatus extends _LogStatus {
  _DebugLogStatus() : super('DEBUG', '🤡', '\u001b[36m');
}
