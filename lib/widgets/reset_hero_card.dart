import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';

/// The grounding "Help Me Reset" hero.
///
/// Tapping the CTA swaps it into a brief "breathing with you" state — a small
/// reassuring acknowledgement rather than a navigation jump, mirroring the
/// micro-interaction in the blueprint.
class ResetHeroCard extends StatefulWidget {
  const ResetHeroCard({super.key, this.onReset});

  final VoidCallback? onReset;

  @override
  State<ResetHeroCard> createState() => _ResetHeroCardState();
}

class _ResetHeroCardState extends State<ResetHeroCard> {
  static const _breathingHold = Duration(milliseconds: 2500);

  Timer? _resetTimer;
  bool _breathing = false;
  bool _pressed = false;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  void _handleReset() {
    widget.onReset?.call();
    _resetTimer?.cancel();
    setState(() => _breathing = true);
    _resetTimer = Timer(_breathingHold, () {
      if (mounted) setState(() => _breathing = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // Soft organic ambient light, translated from the blueprint's
          // blurred decorative circles.
          const Positioned(
            right: -32,
            bottom: -40,
            child: _AmbientGlow(
              size: 176,
              color: AppColors.secondaryContainer,
              opacity: 0.55,
            ),
          ),
          const Positioned(
            right: -8,
            top: 8,
            child: _AmbientGlow(
              size: 112,
              color: AppColors.primaryFixed,
              opacity: 0.35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.eco_outlined,
                        size: 15,
                        color: AppColors.onSecondaryFixedVariant,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Quiet refuge',
                        style: AppTextStyles.labelSm.copyWith(
                          color: AppColors.onSecondaryFixedVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What would help right now?',
                        style: AppTextStyles.headlineMd.onSurfaceColor,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "You don't have to figure everything out at once.",
                        style: AppTextStyles.bodySm.secondaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _ResetButton(
                  breathing: _breathing,
                  pressed: _pressed,
                  onTapDown: () => setState(() => _pressed = true),
                  onTapUp: () => setState(() => _pressed = false),
                  onTap: _handleReset,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton({
    required this.breathing,
    required this.pressed,
    required this.onTap,
    required this.onTapDown,
    required this.onTapUp,
  });

  final bool breathing;
  final bool pressed;
  final VoidCallback onTap;
  final VoidCallback onTapDown;
  final VoidCallback onTapUp;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: pressed ? 0.98 : 1,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      child: GestureDetector(
        onTapDown: (_) => onTapDown(),
        onTapUp: (_) => onTapUp(),
        onTapCancel: onTapUp,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(999),
            boxShadow: AppTheme.floatingShadow,
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Row(
                key: ValueKey(breathing),
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    breathing ? Icons.favorite : Icons.spa_outlined,
                    size: 20,
                    color: AppColors.onPrimary,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      breathing ? 'Breathing with you...' : 'Help Me Reset',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.labelLg.copyWith(
                        color: AppColors.onPrimary,
                        letterSpacing: 0.4,
                      ),
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

/// A soft radial falloff used in place of a `blur` filter, which keeps the
/// hero cheap to rasterise while still reading as diffused light.
class _AmbientGlow extends StatelessWidget {
  const _AmbientGlow({
    required this.size,
    required this.color,
    required this.opacity,
  });

  final double size;
  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: opacity),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}
