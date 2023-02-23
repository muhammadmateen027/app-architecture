import 'package:stars/redux/actions.dart';
import 'package:stars/spacex/redux/actions.dart';

Stream<dynamic> resetAppState() async* {
  final iterator = initialActions.iterator;
  while (iterator.moveNext()) {
    yield iterator.current;
  }
}

List<Action> initialActions = [
  const FetchLaunchesAction(),
];
