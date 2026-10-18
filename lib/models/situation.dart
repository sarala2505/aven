import 'package:flutter/material.dart';

/// A "What's on your mind?" situational entry.
///
/// Each card carries its own surface tint so the carousel reads as a calm,
/// varied set of botanical washes rather than a repeated chrome.
@immutable
class Situation {
  const Situation({
    required this.title,
    required this.tagline,
    required this.icon,
    required this.surfaceColor,
    required this.iconColor,
    required this.titleColor,
    required this.taglineBackground,
    required this.taglineColor,
  });

  final String title;
  final String tagline;
  final IconData icon;
  final Color surfaceColor;
  final Color iconColor;
  final Color titleColor;
  final Color taglineBackground;
  final Color taglineColor;
}

/// A saved technique shown in the "Favorite techniques" list.
@immutable
class Technique {
  const Technique({
    required this.name,
    required this.meta,
    required this.icon,
    required this.metaIcon,
    required this.iconBackground,
    required this.iconColor,
  });

  final String name;
  final String meta;
  final IconData icon;
  final IconData metaIcon;
  final Color iconBackground;
  final Color iconColor;
}
