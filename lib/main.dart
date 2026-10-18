import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const AvenApp());
}

/// Aven — a quiet, restorative space for stress reduction and nervous system
/// regulation.
class AvenApp extends StatelessWidget {
  const AvenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aven',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
