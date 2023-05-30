import 'package:mocktail/mocktail.dart';
import 'package:redux/redux.dart';
import 'package:stars/api/api.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/startup/graph.dart';

class MockGraph extends Mock implements Graph {}

class MockStore extends Mock implements Store<AppState> {}

class MockApi extends Mock implements Api {}
