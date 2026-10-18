import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

/// The recurring dashboard heading: a title with an optional supporting line
/// beneath it and an optional trailing label (e.g. "See all", "No pressure").
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.trailingText,
    this.onTrailingTap,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final String? trailingText;
  final VoidCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    final Widget? trailingWidget =
        trailing ??
        (trailingText == null
            ? null
            : (onTrailingTap == null
                  ? Text(
                      trailingText!,
                      style: AppTextStyles.labelMd.secondaryColor,
                    )
                  : TextButton(
                      onPressed: onTrailingTap,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        trailingText!,
                        style: AppTextStyles.labelMd.primaryColor,
                      ),
                    )));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.headlineSm.onSurfaceColor,
              ),
            ),
            ?trailingWidget,
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(subtitle!, style: AppTextStyles.bodySm.secondaryColor),
        ],
      ],
    );
  }
}
