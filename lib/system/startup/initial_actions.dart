import 'package:stars/pages/pages.dart';
import 'package:stars/redux/actions.dart';

Stream<dynamic> resetAppState() async* {
  final iterator = initialActions.iterator;
  while (iterator.moveNext()) {
    yield iterator.current;
  }
}

List<Action> initialActions = [
  const FetchLaunchesAction(),
];
