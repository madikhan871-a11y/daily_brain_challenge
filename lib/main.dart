import 'package:flutter/material.dart';

import 'screens/challenge_screen.dart';

void main() {
  runApp(const DailyBrainChallengeApp());
}

class DailyBrainChallengeApp extends StatelessWidget {
  const DailyBrainChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Brain Challenge',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0E1017),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9B8AFB),
          brightness: Brightness.dark,
        ),
      ),
      home: const ChallengeScreen(),
    );
  }
}