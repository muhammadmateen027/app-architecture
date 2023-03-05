import 'package:custom_app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// {@macro app_theme}
/// The Default App Theme [ThemeData].
/// {end_template}
class AppTheme {
  /// {@app_theme}
  const AppTheme();

  /// Default `ThemeData` for Very Good UI.
  ThemeData get themeData {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColorLight,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      buttonTheme: _buttonTheme,
      splashColor: AppColors.transparent,
      snackBarTheme: _snackBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      colorScheme: _colorScheme,
      textSelectionTheme: _textSelectionTheme,
      cupertinoOverrideTheme: _cupertinoThemeData,
    );
  }

  TextSelectionThemeData get _textSelectionTheme =>
      const TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
        selectionColor: AppColors.primaryColorLight,
      );

  CupertinoThemeData get _cupertinoThemeData =>
      const CupertinoThemeData(primaryColor: AppColors.primaryDarkColor);

  ColorScheme get _colorScheme {
    return const ColorScheme.light(
      primary: AppColors.primaryColor, // Makes circular progress orange
      secondary: AppColors.secondaryColor,
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: AppTextStyle.bodyLarge.copyWith(
        color: AppColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.primaryColor,
      backgroundColor: AppColors.black,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  Color get _backgroundColor => AppColors.white;

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      titleTextStyle: _textTheme.labelLarge,
      toolbarTextStyle: _textTheme.titleMedium,
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(color: AppColors.black);
  }

  DividerThemeData get _dividerTheme {
    return DividerThemeData(
      color: AppColors.grey.shade300,
      space: AppSpacing.xxxs,
      thickness: AppSpacing.xxxs,
      indent: 56,
      endIndent: AppSpacing.lg,
    );
  }

  TextTheme get _textTheme {
    return TextTheme(
      displayLarge: AppTextStyle.displayLarge,
      displayMedium: AppTextStyle.displayMedium,
      displaySmall: AppTextStyle.displaySmall,
      headlineMedium: AppTextStyle.headlineMedium,
      headlineSmall: AppTextStyle.headlineSmall,
      titleLarge: AppTextStyle.titleLarge,
      titleMedium: AppTextStyle.titleMedium,
      titleSmall: AppTextStyle.titleSmall,
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      labelLarge: AppTextStyle.labelLarge,
      bodySmall: AppTextStyle.bodySmall,
      labelSmall: AppTextStyle.labelSmall,
    ).apply(
      bodyColor: AppColors.black,
      displayColor: AppColors.black,
      decorationColor: AppColors.black,
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: AppColors.grey.shade300),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: AppColors.grey.shade300),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor, width: 2),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor, width: 2),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: AppColors.grey.shade300),
      ),
      hintStyle: const TextStyle(color: AppColors.primaryColor, fontSize: 11),
    );
  }

  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.primaryColorLight;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.primaryDarkColor;
            }
            return AppColors.primaryColor;
          },
        ),
        elevation: MaterialStateProperty.resolveWith<double>((_) => 0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets?>(
          const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        ),
        textStyle: MaterialStateProperty.all<TextStyle?>(
          _textTheme.bodyMedium,
        ),
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        textStyle: _textTheme.labelMedium?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
      ),
    );
  }
}

/// {@macro app_theme}
/// Dark Mode App Theme [ThemeData].
/// {@end_template}
class AppDarkTheme extends AppTheme {
  /// {@app_theme}
  const AppDarkTheme();

  @override
  ColorScheme get _colorScheme {
    return const ColorScheme.dark().copyWith(
      primary: AppColors.black,
      secondary: AppColors.secondaryColor,
    );
  }

  @override
  TextTheme get _textTheme {
    return super._textTheme.apply(
          bodyColor: AppColors.white,
          displayColor: AppColors.white,
          decorationColor: AppColors.white,
        );
  }

  @override
  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: AppTextStyle.bodyLarge.copyWith(
        color: AppColors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.white,
      backgroundColor: AppColors.grey.shade300,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  @override
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
      ),
    );
  }

  @override
  Color get _backgroundColor => AppColors.black;

  @override
  IconThemeData get _iconTheme {
    return const IconThemeData(color: AppColors.white);
  }

  @override
  DividerThemeData get _dividerTheme {
    return DividerThemeData(
      color: AppColors.grey.shade300,
      space: AppSpacing.xxxs,
      thickness: AppSpacing.xxxs,
      indent: 56,
      endIndent: AppSpacing.lg,
    );
  }
}
