import 'package:flutter/material.dart';

import '../data/question_data.dart';
import '../widgets/answer_option.dart';
import '../widgets/question_card.dart';
import 'result_screen.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool showResult = false;

  void selectAnswer(int index) {
    if (showResult) return;

    setState(() {
      selectedAnswer = index;
      showResult = true;

      if (index == questions[currentQuestion].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (!showResult) return;

    if (currentQuestion == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: questions.length,
          ),
        ),
      );
      return;
    }

    setState(() {
      currentQuestion++;
      selectedAnswer = null;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final bool isCorrect = selectedAnswer == question.correctAnswer;

    return Scaffold(
      backgroundColor: const Color(0xFF0E1017),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: const Color(0xFF191B25),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.psychology_rounded,
                      color: Color(0xFFBEB4FF),
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DAILY CHALLENGE',
                          style: TextStyle(
                            color: Color(0xFF9B8AFB),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Train Your Brain',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2D25),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.local_fire_department_rounded,
                          color: Color(0xFFFFA94D),
                          size: 19,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  _InfoCard(
                    icon: Icons.stars_rounded,
                    label: 'SCORE',
                    value: '$score',
                  ),
                  const SizedBox(width: 12),
                  _InfoCard(
                    icon: Icons.bolt_rounded,
                    label: 'LEVEL',
                    value: '03',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              QuestionCard(
                question: question.question,
                questionNumber: currentQuestion + 1,
                totalQuestions: questions.length,
              ),
              const SizedBox(height: 22),
              const Text(
                'Choose your answer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              ...List.generate(
                question.options.length,
                    (index) => AnswerOption(
                  text: question.options[index],
                  index: index,
                  selectedIndex: selectedAnswer,
                  correctIndex: question.correctAnswer,
                  showResult: showResult,
                  onTap: () => selectAnswer(index),
                ),
              ),
              if (showResult) ...[
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? const Color(0xFF153B2B)
                        : const Color(0xFF402029),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        isCorrect
                            ? Icons.check_circle_rounded
                            : Icons.info_rounded,
                        color: isCorrect
                            ? const Color(0xFF4ADE80)
                            : const Color(0xFFFF9BAA),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isCorrect ? 'Correct!' : 'Not quite!',
                              style: TextStyle(
                                color: isCorrect
                                    ? const Color(0xFF86EFAC)
                                    : const Color(0xFFFF9BAA),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              question.explanation,
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 13,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: showResult ? nextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B8AFB),
                    disabledBackgroundColor: const Color(0xFF292B35),
                    foregroundColor: const Color(0xFF11111A),
                    disabledForegroundColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Text(
                    currentQuestion == questions.length - 1
                        ? 'Finish Challenge'
                        : 'Next Question',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF191B25),
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: const Color(0xFF2A2D38),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF9B8AFB),
              size: 22,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}