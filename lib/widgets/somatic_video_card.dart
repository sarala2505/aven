import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// "Understand your body" preview card — a short somatic explainer with a
/// thumbnail and play affordance.
///
/// The blueprint points at a remote illustration URL; the image is bundled as
/// an asset so the card renders offline and in tests.
class SomaticVideoCard extends StatelessWidget {
  const SomaticVideoCard({super.key, this.onPlay});

  final VoidCallback? onPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/somatic_calm.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const ColoredBox(color: AppColors.secondaryContainer),
                  ),
                  ColoredBox(
                    color: AppColors.primaryContainer.withValues(alpha: 0.2),
                  ),
                  Center(
                    child: Material(
                      color: AppColors.surfaceContainerLowest.withValues(
                        alpha: 0.9,
                      ),
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: onPlay,
                        child: const SizedBox(
                          width: 32,
                          height: 32,
                          child: Icon(
                            Icons.play_arrow,
                            size: 18,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3 MIN VIDEO',
                  style: AppTextStyles.labelSm.copyWith(
                    color: AppColors.primaryContainer,
                    letterSpacing: 0.66,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Why our brains freeze under pressure',
                  style: AppTextStyles.labelLg.onSurfaceColor,
                ),
                const SizedBox(height: 4),
                Text(
                  'Understanding the amygdala reset',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySm.secondaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
