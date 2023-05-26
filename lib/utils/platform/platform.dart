import 'package:flutter/material.dart';
import 'package:stars/system/startup/injector.dart';
import 'package:stars/utils/platform/shared.dart' as p;

abstract class HostPlatform {
  const HostPlatform();

  bool get isWeb;

  bool get isDesktop;

  bool get isMobile;

  OperatingPlatform get platform;

  @override
  String toString() {
    return 'HostPlatform{isDesktop: $isDesktop, isMobile: $isMobile, '
        'isWeb: $isWeb, platform: $platform}';
  }
}

class SystemPlatform extends HostPlatform {
  const SystemPlatform();

  @override
  bool get isDesktop => p.isDesktop;

  @override
  bool get isMobile => p.isMobile;

  @override
  bool get isWeb => p.isWeb;

  @override
  OperatingPlatform get platform => PlatformFactory.platform;
}

class TestPlatform extends HostPlatform {
  const TestPlatform({
    required this.isDesktopTest,
    required this.isMobileTest,
    required this.isWebTest,
    required this.platformTest,
  });

  final bool isDesktopTest;
  final bool isMobileTest;
  final bool isWebTest;
  final OperatingPlatform platformTest;

  @override
  bool get isDesktop => isDesktopTest;

  @override
  bool get isMobile => isMobileTest;

  @override
  bool get isWeb => isWebTest;

  @override
  OperatingPlatform get platform => platformTest;
}

bool isPlatformWeb(BuildContext context) =>
    InjectorWidget.of(context).hostPlatform.isWeb;

abstract class OperatingPlatform {}

class PlatformFactory {
  const PlatformFactory._();

  static OperatingPlatform get platform {
    if (p.isAndroid) {
      return const AndroidPlatform();
    } else if (p.isIOS) {
      return const IOSPlatform();
    } else if (p.isLinux) {
      return const LinuxPlatform();
    } else if (p.isMacOS) {
      return const MacOSPlatform();
    } else if (p.isWeb) {
      return const WebPlatform();
    } else if (p.isWindows) {
      return const WindowsPlatform();
    }

    throw Exception('Platform not recognized');
  }
}

class WindowsPlatform implements OperatingPlatform {
  const WindowsPlatform();
}

class LinuxPlatform implements OperatingPlatform {
  const LinuxPlatform();
}

class MacOSPlatform implements OperatingPlatform {
  const MacOSPlatform();
}

class AndroidPlatform implements OperatingPlatform {
  const AndroidPlatform();
}

class IOSPlatform implements OperatingPlatform {
  const IOSPlatform();
}

class WebPlatform implements OperatingPlatform {
  const WebPlatform();
}
