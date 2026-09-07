import 'package:flutter/material.dart';

import 'challenge_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = score / totalQuestions;

    String title;
    String message;
    IconData icon;

    if (percentage >= 0.8) {
      title = 'Brilliant Work!';
      message = 'Your brain is on fire. Great job!';
      icon = Icons.emoji_events_rounded;
    } else if (percentage >= 0.5) {
      title = 'Good Job!';
      message = 'Nice effort. Keep practicing!';
      icon = Icons.auto_awesome_rounded;
    } else {
      title = 'Keep Going!';
      message = 'Every challenge is a chance to learn.';
      icon = Icons.psychology_rounded;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0E1017),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    color: const Color(0xFF29244A),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF9B8AFB).withValues(alpha: 0.20),
                        blurRadius: 35,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFFBEB4FF),
                    size: 52,
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'CHALLENGE COMPLETE',
                  style: TextStyle(
                    color: Color(0xFF9B8AFB),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 35),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF191B25),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color(0xFF2A2D38),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'YOUR SCORE',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$score / $totalQuestions',
                        style: const TextStyle(
                          color: Color(0xFFBEB4FF),
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${(percentage * 100).round()}% accuracy',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChallengeScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text(
                      'Try Again',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9B8AFB),
                      foregroundColor: const Color(0xFF11111A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}