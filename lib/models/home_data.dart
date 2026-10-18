import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'situation.dart';

/// Static content for the home dashboard.
///
/// Kept out of the widget tree so the screen stays declarative and this data
/// can later be swapped for a repository or API without touching the UI.

/// A translucent white surface used for icon discs and tag pills that sit on
/// top of a tinted card.
const _white80 = Color(0xCCFFFFFF);
const _white90 = Color(0xE6FFFFFF);

const List<Situation> homeSituations = <Situation>[
  Situation(
    title: 'Test stress',
    tagline: '3 practices',
    icon: Icons.menu_book_outlined,
    surfaceColor: AppColors.secondaryContainer,
    iconColor: AppColors.primary,
    titleColor: AppColors.onSecondaryFixed,
    taglineBackground: AppColors.primaryContainer,
    taglineColor: AppColors.secondaryContainer,
  ),
  Situation(
    title: 'Presentation nerves',
    tagline: 'Body release',
    icon: Icons.record_voice_over_outlined,
    surfaceColor: AppColors.tertiaryFixed,
    iconColor: AppColors.tertiary,
    titleColor: AppColors.onTertiaryFixed,
    taglineBackground: _white90,
    taglineColor: AppColors.onTertiaryFixedVariant,
  ),
  Situation(
    title: 'Homework overload',
    tagline: 'One step focus',
    icon: Icons.layers_outlined,
    surfaceColor: AppColors.primaryFixed,
    iconColor: AppColors.primary,
    titleColor: AppColors.onPrimaryFixed,
    taglineBackground: _white90,
    taglineColor: AppColors.onPrimaryFixedVariant,
  ),
  Situation(
    title: 'Social overthinking',
    tagline: 'Thought pause',
    icon: Icons.forum_outlined,
    surfaceColor: AppColors.surfaceContainerHigh,
    iconColor: AppColors.onSurfaceVariant,
    titleColor: AppColors.onSurface,
    taglineBackground: _white90,
    taglineColor: AppColors.onSurfaceVariant,
  ),
  Situation(
    title: 'Sports pressure',
    tagline: 'Nerve balance',
    icon: Icons.directions_run,
    surfaceColor: AppColors.secondaryFixedDim,
    iconColor: AppColors.primary,
    titleColor: AppColors.onSecondaryFixed,
    taglineBackground: _white90,
    taglineColor: AppColors.onSecondaryFixedVariant,
  ),
  Situation(
    title: 'College & future',
    tagline: 'Horizon view',
    icon: Icons.explore_outlined,
    surfaceColor: AppColors.surfaceContainer,
    iconColor: AppColors.onSurface,
    titleColor: AppColors.onSurface,
    taglineBackground: _white90,
    taglineColor: AppColors.textSecondary,
  ),
  Situation(
    title: 'Stress without cause',
    tagline: 'Gentle anchor',
    icon: Icons.filter_drama_outlined,
    surfaceColor: AppColors.surfaceContainerHighest,
    iconColor: AppColors.textSecondary,
    titleColor: AppColors.onSurface,
    taglineBackground: _white90,
    taglineColor: AppColors.onSurfaceVariant,
  ),
];

const List<Technique> homeTechniques = <Technique>[
  Technique(
    name: 'Gentle Breathing',
    meta: '4-min relaxing cycle',
    icon: Icons.air,
    metaIcon: Icons.schedule,
    iconBackground: AppColors.secondaryContainer,
    iconColor: AppColors.primary,
  ),
  Technique(
    name: '5-4-3-2-1 Grounding',
    meta: 'Sensory anchoring',
    icon: Icons.fingerprint,
    metaIcon: Icons.psychology_outlined,
    iconBackground: AppColors.tertiaryFixed,
    iconColor: AppColors.tertiary,
  ),
];

/// Days the user has made time for themselves this week (Mon-first).
const int weeklyRhythmDaysAttended = 3;
const List<String> weeklyRhythmLabels = <String>['M', 'T', 'W', 'T', 'F', 'S', 'S'];

/// Icon disc filler for situation cards — a soft frosted surface over the tint.
const Color situationIconDisc = _white80;
