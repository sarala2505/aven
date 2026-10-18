import 'package:flutter/material.dart';

/// Colour tokens from the "Serene Sanctuary" design system.
///
/// Values are taken verbatim from the blueprint's DESIGN.md so the palette
/// stays the single source of truth for the whole app.
abstract final class AppColors {
  // Base canvas — warm mineral off-white, chosen to avoid blue-light glare.
  static const surface = Color(0xFFFAF9F4);
  static const surfaceDim = Color(0xFFDBDAD5);
  static const surfaceBright = Color(0xFFFAF9F4);

  // Tonal layering used for the soft "layered paper" depth of the design.
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF5F4EF);
  static const surfaceContainer = Color(0xFFEFEEE9);
  static const surfaceContainerHigh = Color(0xFFE9E8E3);
  static const surfaceContainerHighest = Color(0xFFE3E3DE);

  // Text.
  static const onSurface = Color(0xFF1B1C19);
  static const onSurfaceVariant = Color(0xFF404847);
  static const textSecondary = Color(0xFF556159);

  // Deep botanical teal — focal CTAs and grounding accents.
  static const primary = Color(0xFF094442);
  static const primaryContainer = Color(0xFF285C59);
  static const onPrimary = Color(0xFFFFFFFF);
  static const onPrimaryContainer = Color(0xFF9ED2CE);

  // Soft sage — container fills, selected chips, progress tracks.
  static const secondaryContainer = Color(0xFFD9E6DB);
  static const secondaryFixedDim = Color(0xFFBDCABF);
  static const onSecondaryFixed = Color(0xFF131E17);
  static const onSecondaryFixedVariant = Color(0xFF3E4A42);

  // Pale lavender — introspective and reflection surfaces.
  static const tertiary = Color(0xFF3D3C47);
  static const tertiaryFixed = Color(0xFFE4E0EF);
  static const onTertiaryFixed = Color(0xFF1B1A25);
  static const onTertiaryFixedVariant = Color(0xFF474551);

  // Muted sky — breath and somatic exercise surfaces.
  static const primaryFixed = Color(0xFFB7EDE8);
  static const onPrimaryFixed = Color(0xFF00201E);
  static const onPrimaryFixedVariant = Color(0xFF184F4C);

  // Outlines.
  static const outline = Color(0xFF707978);
  static const outlineVariant = Color(0xFFBFC8C7);

  // Semantic feedback.
  static const success = Color(0xFF39745A);
  static const warning = Color(0xFF936C31);
  static const error = Color(0xFFBA1A1A);

  /// Shadows are tinted with deep botanical pigment rather than synthetic
  /// black, mimicking soft diffused morning light.
  static const shadow = Color(0xFF253330);
}
