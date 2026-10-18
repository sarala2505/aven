import 'package:flutter/material.dart';

import 'app_colors.dart';

/// The typographic scale from the "Serene Sanctuary" design system.
///
/// Design tokens express letter-spacing in `em`, which Flutter expects in
/// logical pixels, so the values below are the em figures multiplied by the
/// style's font size. Line heights are expressed as ratios of the specified
/// pixel line height to font size.
///
/// Weight discipline is deliberate: Regular (400) for contemplative body copy,
/// Medium (500) / Semi-Bold (600) for titles and labels. Bold and heavier are
/// excluded to avoid aggressive visual hierarchies.
abstract final class AppTextStyles {
  static const _family = 'Inter';

  static const display = TextStyle(
    fontFamily: _family,
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 44 / 36,
    letterSpacing: -0.72,
  );

  static const headlineLg = TextStyle(
    fontFamily: _family,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 36 / 28,
    letterSpacing: -0.42,
  );

  static const headlineLgMobile = TextStyle(
    fontFamily: _family,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: -0.24,
  );

  static const headlineMd = TextStyle(
    fontFamily: _family,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    letterSpacing: -0.20,
  );

  static const headlineSm = TextStyle(
    fontFamily: _family,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
  );

  static const bodyLg = TextStyle(
    fontFamily: _family,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 26 / 17,
    letterSpacing: -0.085,
  );

  static const bodyMd = TextStyle(
    fontFamily: _family,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 22 / 15,
  );

  static const bodySm = TextStyle(
    fontFamily: _family,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 18 / 13,
    letterSpacing: 0.065,
  );

  static const labelLg = TextStyle(
    fontFamily: _family,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 20 / 15,
    letterSpacing: 0.15,
  );

  static const labelMd = TextStyle(
    fontFamily: _family,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 18 / 13,
    letterSpacing: 0.195,
  );

  static const labelSm = TextStyle(
    fontFamily: _family,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 14 / 11,
    letterSpacing: 0.33,
  );
}

/// Convenience semantic colours applied on top of the raw tokens, so screens
/// never have to remember which token maps to which role.
extension AppTextStyleColors on TextStyle {
  TextStyle get onSurfaceColor => copyWith(color: AppColors.onSurface);
  TextStyle get secondaryColor => copyWith(color: AppColors.textSecondary);
  TextStyle get primaryColor => copyWith(color: AppColors.primaryContainer);
}
