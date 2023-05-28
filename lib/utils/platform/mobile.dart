import 'dart:io';

import 'package:flutter/material.dart';

bool isDesktop = Platform.isWindows || Platform.isLinux || Platform.isMacOS;
bool isMobile = Platform.isAndroid || Platform.isIOS;
bool isIOS = Platform.isIOS;
bool isMacOS = Platform.isMacOS;
bool isLinux = Platform.isLinux;
bool isWindows = Platform.isWindows;
bool isAndroid = Platform.isAndroid;
const bool isWeb = false;

bool isApple(BuildContext context) {
  final platform = Theme.of(context).platform;

  return platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
}
