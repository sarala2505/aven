import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

/// Assembles the "Serene Sanctuary" design system into a [ThemeData].
abstract final class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: AppColors.surface,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryContainer,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.secondaryContainer,
        onPrimaryContainer: AppColors.primary,
        secondary: AppColors.textSecondary,
        onSecondary: AppColors.onPrimary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
        onError: AppColors.onPrimary,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
      ),
    );

    return base.copyWith(
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.display,
        headlineLarge: AppTextStyles.headlineLg,
        headlineMedium: AppTextStyles.headlineMd,
        headlineSmall: AppTextStyles.headlineSm,
        bodyLarge: AppTextStyles.bodyLg,
        bodyMedium: AppTextStyles.bodyMd,
        bodySmall: AppTextStyles.bodySm,
        labelLarge: AppTextStyles.labelLg,
        labelMedium: AppTextStyles.labelMd,
        labelSmall: AppTextStyles.labelSm,
      ),
      // Elevated white cards float against the warm canvas, so the default
      // Material elevation tint and shadow colour are replaced with the
      // pigment-tinted ambient shading from the design system.
      cardTheme: CardThemeData(
        color: AppColors.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      splashFactory: InkSparkle.splashFactory,
    );
  }

  /// Ambient, pigment-tinted card shadow — deliberately soft and diffused
  /// rather than a harsh synthetic drop shadow.
  static const List<BoxShadow> restingCardShadow = [
    BoxShadow(
      color: Color(0x0A253330),
      blurRadius: 16,
      offset: Offset(0, 4),
      spreadRadius: -2,
    ),
    BoxShadow(
      color: Color(0x05253330),
      blurRadius: 6,
      offset: Offset(0, 2),
      spreadRadius: -1,
    ),
  ];

  /// Slightly deeper shadow for floating / elevated controls.
  static const List<BoxShadow> floatingShadow = [
    BoxShadow(
      color: Color(0x12253330),
      blurRadius: 24,
      offset: Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x08253330),
      blurRadius: 8,
      offset: Offset(0, 3),
      spreadRadius: -2,
    ),
  ];
}
