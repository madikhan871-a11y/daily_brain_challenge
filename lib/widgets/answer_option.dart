import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String text;
  final int index;
  final int? selectedIndex;
  final int correctIndex;
  final bool showResult;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.correctIndex,
    required this.showResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;
    final bool isCorrect = correctIndex == index;

    Color backgroundColor = const Color(0xFF191B25);
    Color borderColor = const Color(0xFF303342);
    Color textColor = Colors.white70;
    IconData? icon;

    if (showResult && isCorrect) {
      backgroundColor = const Color(0xFF153B2B);
      borderColor = const Color(0xFF4ADE80);
      textColor = const Color(0xFF86EFAC);
      icon = Icons.check_circle_rounded;
    } else if (showResult && isSelected && !isCorrect) {
      backgroundColor = const Color(0xFF402029);
      borderColor = const Color(0xFFFF6B81);
      textColor = const Color(0xFFFF9BAA);
      icon = Icons.cancel_rounded;
    } else if (isSelected) {
      backgroundColor = const Color(0xFF29244A);
      borderColor = const Color(0xFF9B8AFB);
      textColor = const Color(0xFFD8D0FF);
    }

    return GestureDetector(
      onTap: showResult ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: borderColor,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: borderColor.withValues(alpha: 0.16),
                shape: BoxShape.circle,
              ),
              child: Text(
                String.fromCharCode(65 + index),
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (icon != null)
              Icon(
                icon,
                color: textColor,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}