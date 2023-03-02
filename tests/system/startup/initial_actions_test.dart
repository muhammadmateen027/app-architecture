import 'package:stars/pages/spacex/redux/actions.dart';
import 'package:stars/system/startup/initial_actions.dart';
import 'package:test/test.dart';

void main() {
  test(
    'emits reset actions',
    () async {
      final events = resetAppState();

      expect(
        events,
        emitsInOrder([const FetchLaunchesAction()]),
      );
    },
  );
}
