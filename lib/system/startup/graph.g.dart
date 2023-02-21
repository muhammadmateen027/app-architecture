// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Graph extends Graph {
  @override
  final Map<String, dynamic> arguments;
  @override
  final Dio internalDio;
  @override
  final Api api;
  @override
  final Environment environment;
  @override
  final double timeDilation;

  factory _$Graph([void Function(GraphBuilder)? updates]) =>
      (new GraphBuilder()..update(updates))._build();

  _$Graph._(
      {required this.arguments,
      required this.internalDio,
      required this.api,
      required this.environment,
      required this.timeDilation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(arguments, r'Graph', 'arguments');
    BuiltValueNullFieldError.checkNotNull(internalDio, r'Graph', 'internalDio');
    BuiltValueNullFieldError.checkNotNull(api, r'Graph', 'api');
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
        internalDio == other.internalDio &&
        api == other.api &&
        environment == other.environment &&
        timeDilation == other.timeDilation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, arguments.hashCode);
    _$hash = $jc(_$hash, internalDio.hashCode);
    _$hash = $jc(_$hash, api.hashCode);
    _$hash = $jc(_$hash, environment.hashCode);
    _$hash = $jc(_$hash, timeDilation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Graph')
          ..add('arguments', arguments)
          ..add('internalDio', internalDio)
          ..add('api', api)
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

  Dio? _internalDio;
  Dio? get internalDio => _$this._internalDio;
  set internalDio(Dio? internalDio) => _$this._internalDio = internalDio;

  Api? _api;
  Api? get api => _$this._api;
  set api(Api? api) => _$this._api = api;

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
      _internalDio = $v.internalDio;
      _api = $v.api;
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
            internalDio: BuiltValueNullFieldError.checkNotNull(
                internalDio, r'Graph', 'internalDio'),
            api: BuiltValueNullFieldError.checkNotNull(api, r'Graph', 'api'),
            environment: BuiltValueNullFieldError.checkNotNull(
                environment, r'Graph', 'environment'),
            timeDilation: BuiltValueNullFieldError.checkNotNull(
                timeDilation, r'Graph', 'timeDilation'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
