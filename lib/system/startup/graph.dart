import 'package:built_value/built_value.dart';
import 'package:stars/system/device_info/info.dart';
import 'package:stars/system/startup/disposable.dart';
import 'package:stars/utils/environment.dart';
import 'package:stars/utils/platform/platform.dart';

part 'graph.g.dart';

abstract class Graph implements Built<Graph, GraphBuilder>, Disposable {
  factory Graph([void Function(GraphBuilder) updates]) = _$Graph;

  Graph._();

  Map<String, dynamic> get arguments;

  HostPlatform get hostPlatform;

  DeviceInfo get deviceInfo;

  Environment get environment;

  double get timeDilation;

  @override
  void dispose() {
    // TODO(action): add your services to close
  }
}
