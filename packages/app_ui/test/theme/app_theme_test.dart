import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    group('themeData', () {
      test('primary color is orange', () {
        expect(
          const AppTheme().themeData.primaryColor,
          AppColors.primaryColor,
        );
      });

      test('secondary color is teal', () {
        expect(
          const AppTheme().themeData.colorScheme.secondary,
          AppColors.secondaryColor,
        );
      });
    });
  });

  group('AppDarkTheme', () {
    group('themeData', () {
      test('primary color is orange', () {
        expect(
          const AppDarkTheme().themeData.primaryColor,
          AppColors.primaryColor,
        );
      });

      test('secondary color is teal', () {
        expect(
          const AppDarkTheme().themeData.colorScheme.secondary,
          AppColors.secondaryColor,
        );
      });
    });
  });
}
