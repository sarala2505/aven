import 'package:flutter/material.dart';

import '../models/home_data.dart';
import '../models/situation.dart';
import '../theme/app_text_styles.dart';

/// A single card in the "What's on your mind?" carousel.
///
/// The parent list constrains the height, so the column spreads its content to
/// keep every card's icon and text block aligned regardless of title length.
class SituationCard extends StatelessWidget {
  const SituationCard({super.key, required this.situation, this.onTap});

  static const double width = 160;

  final Situation situation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: situation.surfaceColor,
        borderRadius: BorderRadius.circular(24),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: situationIconDisc,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    situation.icon,
                    size: 22,
                    color: situation.iconColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: situation.taglineBackground,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        situation.tagline,
                        style: AppTextStyles.labelSm.copyWith(
                          color: situation.taglineColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      situation.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.labelLg.copyWith(
                        color: situation.titleColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
