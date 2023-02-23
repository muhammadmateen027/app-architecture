import 'package:stars/redux/app_state.dart';
import 'package:stars/system/startup/graph.dart';

abstract class Register {
  const Register(this.graph, [this.state]);

  final Graph graph;
  final AppState? state;
}
