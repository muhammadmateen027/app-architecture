import 'package:device_info_plus/device_info_plus.dart';

import 'package:stars/utils/platform/platform.dart';

abstract class DeviceInfo {
  Future<DeviceInfo> initialize();

  /// This info is not changing often so we will cache it on start of app into
  /// local state
  late dynamic info;
}

class DeviceStub extends DeviceInfo {
  @override
  Future<DeviceInfo> initialize() {
    info = LinuxDeviceInfo(
      name: 'linux_stub',
      id: 'linux_id',
      prettyName: 'linux_pretty',
      machineId: 'linux_machine_id',
    );

    return Future.value(this);
  }
}

class DeviceInfoFactory extends DeviceInfo {
  DeviceInfoFactory(this.platform, [DeviceInfoPlugin? pluginInstance]) {
    delegate = pluginInstance ?? DeviceInfoPlugin();
  }

  final HostPlatform platform;
  late DeviceInfoPlugin delegate;

  @override
  Future<DeviceInfo> initialize() async {
    switch (platform.platform.runtimeType) {
      case AndroidPlatform:
        info = await delegate.androidInfo;
        return this;
      case IOSPlatform:
        info = await delegate.iosInfo;
        return this;
      case WindowsPlatform:
        info = await delegate.windowsInfo;
        return this;
      case LinuxPlatform:
        info = await delegate.linuxInfo;
        return this;
      case MacOSPlatform:
        info = await delegate.macOsInfo;
        return this;
      case WebPlatform:
        info = await delegate.webBrowserInfo;
        return this;
    }

    throw Exception('Platform not recognized');
  }
}

extension AndroidDeviceInfoExt on AndroidDeviceInfo {
  bool isVersionGreaterThan(int version) => this.version.sdkInt > version;
}
