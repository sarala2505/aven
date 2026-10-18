/// Spacing and shape tokens from the "Serene Sanctuary" design system.
///
/// The rhythm follows a strict 4px/8px base increment, and radii are generous
/// so no surface presents a sharp, threatening edge.
abstract final class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 36.0;

  /// Outer canvas padding on compact (phone) viewports.
  static const marginMobile = 20.0;

  /// Content is centred within this width on tablets to keep the layout intimate.
  static const maxContentWidth = 640.0;
}

abstract final class AppRadius {
  static const sm = 8.0;
  static const field = 16.0;
  static const card = 24.0;
  static const cardLarge = 28.0;
  static const pill = 999.0;
}
