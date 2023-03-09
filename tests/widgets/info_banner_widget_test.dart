import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:stars/widgets/info_banner.dart';

import '../widget_test_utils.dart';

void main() {
  late WidgetTestbed testbed;

  setUp(() {
    testbed = WidgetTestbed();
  });

  patrolTest(
    'find info banner widget',
    (PatrolTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: const InfoBanner(
          child: Text(''),
        ),
      );

      await tester.pumpWidget(testWidget);
    },
  );

  patrolTest(
    'find Text if label is empty',
    (PatrolTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: const InfoBanner(
          child: Text(''),
        ),
      );

      await tester.pumpWidget(testWidget);

      expect(tester(Text), findsOneWidget);
    },
  );

  patrolTest(
    'find info banner if label is not empty',
    (PatrolTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: const InfoBanner(
          label: 'testing',
          child: Text(''),
        ),
      );

      await tester.pumpWidget(testWidget);

      expect(tester(const Key('custom_app_banner')), findsOneWidget);
      expect(tester(Text), findsOneWidget);
    },
  );
}
