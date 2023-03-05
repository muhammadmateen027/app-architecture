import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/generated/fonts.gen.dart';
import 'package:flutter/widgets.dart';

/// App Text Style Definitions
abstract class AppTextStyle {
  static const _baseTextStyle = TextStyle(
    fontWeight: AppFontWeight.regular,
    height: 1.5,
    package: 'app_ui',
    fontFamily: FontFamily.openSans,
  );

  /// Headline 1 Text Style
  static final TextStyle displayLarge = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.bold,
    height: 1.25,
  );

  /// Headline 2 Text Style
  static final TextStyle displayMedium = _baseTextStyle.copyWith(
    fontSize: 26,
    fontWeight: AppFontWeight.extraBold,
    height: 1.25,
  );

  /// Headline 3 Text Style
  static final TextStyle displaySmall = _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: AppFontWeight.extraBold,
    height: 1.25,
  );

  /// Headline 4 Text Style
  static final TextStyle headlineMedium = _baseTextStyle.copyWith(
    fontSize: 20,
    fontWeight: AppFontWeight.extraBold,
    height: 1.25,
  );

  /// Headline 5 Text Style
  static final TextStyle headlineSmall = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: AppFontWeight.extraBold,
    height: 1.25,
  );

  /// Headline 6 Text Style
  static final TextStyle titleLarge = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.bold,
    height: 1.25,
  );

  /// Subtitle 1 Text Style
  static final TextStyle titleMedium = _baseTextStyle.copyWith(
    fontSize: 16,
  );

  /// Subtitle 2 Text Style
  static final TextStyle titleSmall = _baseTextStyle.copyWith(
    fontSize: 14,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyLarge = _baseTextStyle.copyWith(
    fontSize: 14,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyMedium = _baseTextStyle.copyWith(
    fontSize: 16,
  );

  /// Button Text Style
  static final TextStyle labelLarge = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.bold,
  );

  /// Caption Text Style
  static final TextStyle bodySmall = _baseTextStyle.copyWith(
    fontSize: 11,
  );

  /// Cupertino menu item style
  static final TextStyle popupMenu = _baseTextStyle.copyWith(
    fontSize: 16,
    color: AppColors.primaryColor,
  );

  /// Over line Text Style
  static final TextStyle labelSmall = _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: AppFontWeight.medium,
  );
}
