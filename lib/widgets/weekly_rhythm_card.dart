import 'package:flutter/material.dart';

import '../models/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// "Weekly rhythm" reflection card.
///
/// Deliberately non-gamified: it reports presence without streaks, scores or
/// anything that could read as a demand.
class WeeklyRhythmCard extends StatelessWidget {
  const WeeklyRhythmCard({
    super.key,
    this.daysAttended = weeklyRhythmDaysAttended,
    this.labels = weeklyRhythmLabels,
  });

  final int daysAttended;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              // The title absorbs the remaining width and the trailing label
              // keeps its natural size, so the row degrades gracefully on the
              // narrowest supported phones (360px) instead of overflowing.
              Expanded(
                child: Text(
                  'WEEKLY RHYTHM',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.labelSm
                      .copyWith(color: AppColors.textSecondary)
                      .copyWith(letterSpacing: 0.88),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'No pressure',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.labelSm.secondaryColor,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            "You've made time for yourself $daysAttended times this week.",
            style: AppTextStyles.headlineSm.onSurfaceColor,
          ),
          const SizedBox(height: 4),
          Text(
            'Every moment you pause helps your nervous system recalibrate.',
            style: AppTextStyles.bodySm.secondaryColor,
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < labels.length; i++)
                _DayMarker(
                  label: labels[i],
                  attended: i < daysAttended,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DayMarker extends StatelessWidget {
  const _DayMarker({required this.label, required this.attended});

  final String label;
  final bool attended;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: attended
                ? AppColors.secondaryContainer
                : AppColors.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: attended
              ? const Icon(Icons.check, size: 15, color: AppColors.primary)
              : Center(
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.outlineVariant,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 6),
        Text(label, style: AppTextStyles.labelSm.secondaryColor),
      ],
    );
  }
}
