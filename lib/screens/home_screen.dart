import 'package:flutter/material.dart';

import '../models/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/reset_hero_card.dart';
import '../widgets/section_heading.dart';
import '../widgets/situation_card.dart';
import '../widgets/somatic_video_card.dart';
import '../widgets/technique_tile.dart';
import '../widgets/weekly_rhythm_card.dart';

/// App shell: holds the bottom navigation and swaps between destinations.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.userName = 'Maya'});

  final String userName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DashboardHome(userName: widget.userName),
          const _PlaceholderTab(
            icon: Icons.favorite_border,
            title: 'Favorites',
            message:
                'Your saved techniques will gather here once you start '
                'collecting them.',
          ),
          const _PlaceholderTab(
            icon: Icons.query_stats,
            title: 'Progress',
            message:
                'A gentle view of the time you have made for yourself, with '
                'no streaks to keep up.',
          ),
          const _PlaceholderTab(
            icon: Icons.menu_book_outlined,
            title: 'Learn',
            message:
                'Short somatic explainers about what your body does under '
                'pressure.',
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: _selectedIndex,
        onSelected: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

/// The home dashboard itself.
class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key, this.userName = 'Maya'});

  final String userName;

  /// The blueprint shows a warm, daylight-appropriate greeting.
  static String greetingFor(DateTime time) {
    if (time.hour < 12) return 'Good morning';
    if (time.hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    final greeting = greetingFor(DateTime.now());

    return SafeArea(
      bottom: false,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: ListView(
            padding: const EdgeInsets.only(top: 8, bottom: AppSpacing.lg),
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: _BrandAppBar(),
              ),
              const SizedBox(height: AppSpacing.md),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: _Greeting(
                  greeting: greeting,
                  userName: userName,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: ResetHeroCard(),
              ),
              const SizedBox(height: AppSpacing.lg),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: SectionHeading(
                  title: "What's on your mind?",
                  subtitle: 'Choose a situation to find gentle, tailored steps.',
                ),
              ),
              const SizedBox(height: 12),
              // Bleeds to both edges so the carousel can scroll past the
              // margin, while containing its own inset padding.
              const _SituationCarousel(),
              const SizedBox(height: AppSpacing.lg),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: WeeklyRhythmCard(),
              ),
              const SizedBox(height: AppSpacing.lg),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: SectionHeading(
                  title: 'Favorite techniques',
                  trailingText: 'See all',
                  onTrailingTap: () {},
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: Column(
                  children: [
                    for (final technique in homeTechniques) ...[
                      TechniqueTile(technique: technique),
                      if (technique != homeTechniques.last)
                        const SizedBox(height: 10),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: SectionHeading(
                  title: 'Understand your body',
                  trailingText: 'Somatic bite',
                ),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: SomaticVideoCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandAppBar extends StatelessWidget {
  const _BrandAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: AppColors.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.spa_outlined,
            size: 16,
            color: AppColors.onPrimary,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AVEN',
              style: AppTextStyles.labelSm.copyWith(
                color: AppColors.textSecondary,
                letterSpacing: 1.1,
              ),
            ),
            Text('Home', style: AppTextStyles.headlineMd.onSurfaceColor),
          ],
        ),
        const Spacer(),
        // Time-of-day indicator matching the blueprint's twilight icon.
        const _RoundIcon(icon: Icons.wb_twilight),
        const SizedBox(width: 12),
        const _Avatar(initial: 'M'),
      ],
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting({required this.greeting, required this.userName});

  final String greeting;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$greeting, $userName',
          style: AppTextStyles.headlineLgMobile.onSurfaceColor,
        ),
        const SizedBox(height: 2),
        Text(
          'A little space to feel more like yourself.',
          style: AppTextStyles.bodyMd.secondaryColor,
        ),
      ],
    );
  }
}

class _SituationCarousel extends StatelessWidget {
  const _SituationCarousel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.marginMobile,
        ),
        itemCount: homeSituations.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) =>
            SituationCard(situation: homeSituations[index]),
      ),
    );
  }
}

class _RoundIcon extends StatelessWidget {
  const _RoundIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: AppColors.secondaryContainer,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: AppColors.primary),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.initial});

  final String initial;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        shape: BoxShape.circle,
      ),
      child: Text(
        initial,
        style: AppTextStyles.labelMd.copyWith(color: AppColors.primary),
      ),
    );
  }
}

/// A calm, deliberately unfinished destination — honest about what is not
/// built yet rather than showing empty scaffolding.
class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({
    required this.icon,
    required this.title,
    required this.message,
  });

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 28, color: AppColors.primary),
              ),
              const SizedBox(height: 20),
              Text(title, style: AppTextStyles.headlineSm.onSurfaceColor),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMd.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
