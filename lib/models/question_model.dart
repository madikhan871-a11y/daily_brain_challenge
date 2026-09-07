class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String explanation;

  const QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
}