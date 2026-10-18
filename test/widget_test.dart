import 'package:aven/main.dart';
import 'package:aven/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Give the tests a phone-shaped, tall viewport so the whole dashboard is
  /// laid out without having to scroll between assertions.
  void usePhoneViewport(WidgetTester tester) {
    tester.view.physicalSize = const Size(430, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }

  test('greeting tracks the time of day', () {
    expect(
      DashboardHome.greetingFor(DateTime(2026, 1, 1, 9)),
      'Good morning',
    );
    expect(
      DashboardHome.greetingFor(DateTime(2026, 1, 1, 14)),
      'Good afternoon',
    );
    expect(
      DashboardHome.greetingFor(DateTime(2026, 1, 1, 21)),
      'Good evening',
    );
  });

  testWidgets('home dashboard renders its grounding sections', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(const AvenApp());

    // Hero
    expect(find.text('What would help right now?'), findsOneWidget);
    expect(find.text('Help Me Reset'), findsOneWidget);
    expect(find.text('Quiet refuge'), findsOneWidget);

    // Situational carousel (first card is always laid out)
    expect(find.text("What's on your mind?"), findsOneWidget);
    expect(find.text('Test stress'), findsOneWidget);

    // Progress reflection
    expect(find.text('WEEKLY RHYTHM'), findsOneWidget);
    expect(
      find.text("You've made time for yourself 3 times this week."),
      findsOneWidget,
    );

    // Techniques and somatic preview
    expect(find.text('Favorite techniques'), findsOneWidget);
    expect(find.text('Gentle Breathing'), findsOneWidget);
    expect(find.text('5-4-3-2-1 Grounding'), findsOneWidget);
    expect(find.text('Understand your body'), findsOneWidget);
  });

  testWidgets('reset CTA acknowledges the tap then returns', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(const AvenApp());

    await tester.tap(find.text('Help Me Reset'));
    await tester.pump();

    expect(find.text('Breathing with you...'), findsOneWidget);

    // Let the reassurance window elapse so no timer outlives the test.
    await tester.pump(const Duration(seconds: 3));
    expect(find.text('Help Me Reset'), findsOneWidget);
  });

  testWidgets('bottom navigation switches destinations', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(const AvenApp());

    expect(find.text('Help Me Reset'), findsOneWidget);

    await tester.tap(find.text('Favorites'));
    await tester.pumpAndSettle();

    expect(find.text('Help Me Reset'), findsNothing);
    expect(
      find.textContaining('Your saved techniques'),
      findsOneWidget,
    );

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Help Me Reset'), findsOneWidget);
  });

  testWidgets('lays out without overflow on a narrow phone', (tester) async {
    // The design system targets 360-428px widths. Flutter surfaces any
    // RenderFlex overflow as a test exception, so completing this pump is the
    // assertion.
    tester.view.physicalSize = const Size(360, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const AvenApp());

    expect(find.text('Help Me Reset'), findsOneWidget);
    expect(find.text('Gentle Breathing'), findsOneWidget);
  });
}
