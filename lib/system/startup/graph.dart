import 'package:built_value/built_value.dart';
import 'package:dio/dio.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/environment.dart';
import 'package:stars/system/startup/disposable.dart';

part 'graph.g.dart';

abstract class Graph implements Built<Graph, GraphBuilder>, Disposable {
  factory Graph([final void Function(GraphBuilder) updates]) = _$Graph;

  Graph._();

  Map<String, dynamic> get arguments;

  Dio get internalDio;

  Api get api;

  Environment get environment;

  double get timeDilation;
}
