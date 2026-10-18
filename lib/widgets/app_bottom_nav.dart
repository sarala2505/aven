import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// A single destination in the bottom navigation bar.
@immutable
class NavDestination {
  const NavDestination({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

const List<NavDestination> appNavDestinations = <NavDestination>[
  NavDestination(icon: Icons.self_improvement, label: 'Home'),
  NavDestination(icon: Icons.favorite_border, label: 'Favorites'),
  NavDestination(icon: Icons.query_stats, label: 'Progress'),
  NavDestination(icon: Icons.menu_book_outlined, label: 'Learn'),
];

/// Translucent, blurred navigation bar that preserves the grounding spatial
/// context of the content scrolling beneath it.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.9),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D253330),
                blurRadius: 16,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: 64,
              child: Row(
                children: [
                  for (var i = 0; i < appNavDestinations.length; i++)
                    Expanded(
                      child: _NavButton(
                        destination: appNavDestinations[i],
                        selected: i == selectedIndex,
                        onTap: () => onSelected(i),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final NavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? AppColors.primaryContainer
        : AppColors.onSurfaceVariant;

    return Semantics(
      selected: selected,
      button: true,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.secondaryContainer
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Icon(destination.icon, size: 20, color: color),
            ),
            const SizedBox(height: 2),
            Text(
              destination.label,
              style: AppTextStyles.labelSm.copyWith(
                color: color,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
