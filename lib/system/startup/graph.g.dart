// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Graph extends Graph {
  @override
  final Map<String, dynamic> arguments;
  @override
  final HostPlatform hostPlatform;
  @override
  final DeviceInfo deviceInfo;
  @override
  final Environment environment;
  @override
  final double timeDilation;

  factory _$Graph([void Function(GraphBuilder)? updates]) =>
      (new GraphBuilder()..update(updates))._build();

  _$Graph._(
      {required this.arguments,
      required this.hostPlatform,
      required this.deviceInfo,
      required this.environment,
      required this.timeDilation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(arguments, r'Graph', 'arguments');
    BuiltValueNullFieldError.checkNotNull(
        hostPlatform, r'Graph', 'hostPlatform');
    BuiltValueNullFieldError.checkNotNull(deviceInfo, r'Graph', 'deviceInfo');
    BuiltValueNullFieldError.checkNotNull(environment, r'Graph', 'environment');
    BuiltValueNullFieldError.checkNotNull(
        timeDilation, r'Graph', 'timeDilation');
  }

  @override
  Graph rebuild(void Function(GraphBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GraphBuilder toBuilder() => new GraphBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Graph &&
        arguments == other.arguments &&
        hostPlatform == other.hostPlatform &&
        deviceInfo == other.deviceInfo &&
        environment == other.environment &&
        timeDilation == other.timeDilation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, arguments.hashCode);
    _$hash = $jc(_$hash, hostPlatform.hashCode);
    _$hash = $jc(_$hash, deviceInfo.hashCode);
    _$hash = $jc(_$hash, environment.hashCode);
    _$hash = $jc(_$hash, timeDilation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Graph')
          ..add('arguments', arguments)
          ..add('hostPlatform', hostPlatform)
          ..add('deviceInfo', deviceInfo)
          ..add('environment', environment)
          ..add('timeDilation', timeDilation))
        .toString();
  }
}

class GraphBuilder implements Builder<Graph, GraphBuilder> {
  _$Graph? _$v;

  Map<String, dynamic>? _arguments;
  Map<String, dynamic>? get arguments => _$this._arguments;
  set arguments(Map<String, dynamic>? arguments) =>
      _$this._arguments = arguments;

  HostPlatform? _hostPlatform;
  HostPlatform? get hostPlatform => _$this._hostPlatform;
  set hostPlatform(HostPlatform? hostPlatform) =>
      _$this._hostPlatform = hostPlatform;

  DeviceInfo? _deviceInfo;
  DeviceInfo? get deviceInfo => _$this._deviceInfo;
  set deviceInfo(DeviceInfo? deviceInfo) => _$this._deviceInfo = deviceInfo;

  Environment? _environment;
  Environment? get environment => _$this._environment;
  set environment(Environment? environment) =>
      _$this._environment = environment;

  double? _timeDilation;
  double? get timeDilation => _$this._timeDilation;
  set timeDilation(double? timeDilation) => _$this._timeDilation = timeDilation;

  GraphBuilder();

  GraphBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _arguments = $v.arguments;
      _hostPlatform = $v.hostPlatform;
      _deviceInfo = $v.deviceInfo;
      _environment = $v.environment;
      _timeDilation = $v.timeDilation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Graph other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Graph;
  }

  @override
  void update(void Function(GraphBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Graph build() => _build();

  _$Graph _build() {
    final _$result = _$v ??
        new _$Graph._(
            arguments: BuiltValueNullFieldError.checkNotNull(
                arguments, r'Graph', 'arguments'),
            hostPlatform: BuiltValueNullFieldError.checkNotNull(
                hostPlatform, r'Graph', 'hostPlatform'),
            deviceInfo: BuiltValueNullFieldError.checkNotNull(
                deviceInfo, r'Graph', 'deviceInfo'),
            environment: BuiltValueNullFieldError.checkNotNull(
                environment, r'Graph', 'environment'),
            timeDilation: BuiltValueNullFieldError.checkNotNull(
                timeDilation, r'Graph', 'timeDilation'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
