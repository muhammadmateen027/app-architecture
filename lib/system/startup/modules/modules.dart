import 'dart:async';

import 'package:stars/extensions/extensions.dart';
import 'package:stars/system/device_info/info.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/modules/base.dart';
import 'package:stars/utils/environment.dart';
import 'package:stars/utils/platform/platform.dart';

const modules = <Module<dynamic>>[
  DeviceInfoModule(),
  TimeDilationModule(),
  EnvironmentModule(),
];

class EnvironmentModule extends Module<Environment> {
  const EnvironmentModule();

  @override
  Future<Environment> doInitialize(
    HostPlatform platform,
    GraphBuilder builder,
  ) async =>
      builder.environment.liftNonNull;

  @override
  Future<void> doInject(Environment value, GraphBuilder builder) async =>
      builder.environment = value;
}

class DeviceInfoModule extends Module<DeviceInfo> {
  const DeviceInfoModule();

  @override
  Future<DeviceInfo> doInitialize(
    HostPlatform platform,
    GraphBuilder builder,
  ) async {
    return DeviceInfoFactory(platform).initialize();
  }

  @override
  Future<void> doInject(DeviceInfo value, GraphBuilder builder) async {
    builder.deviceInfo = value;
  }
}

class TimeDilationModule extends Module<double> {
  const TimeDilationModule([this.dilation = 1.0]) : assert(dilation > 0, '');

  final double dilation;

  @override
  Future<double> doInitialize(
    HostPlatform platform,
    GraphBuilder builder,
  ) async =>
      dilation;

  @override
  Future<void> doInject(double value, GraphBuilder builder) async {
    builder.timeDilation = value;
  }
}
