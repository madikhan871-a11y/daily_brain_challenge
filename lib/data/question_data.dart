import '../models/question_model.dart';

const List<QuestionModel> questions = [
  QuestionModel(
    question: 'Which planet is known as the Red Planet?',
    options: ['Venus', 'Mars', 'Jupiter', 'Mercury'],
    correctAnswer: 1,
    explanation: 'Mars is commonly called the Red Planet because of its reddish appearance.',
  ),
  QuestionModel(
    question: 'What is 15 + 27?',
    options: ['32', '40', '42', '45'],
    correctAnswer: 2,
    explanation: '15 + 27 = 42.',
  ),
  QuestionModel(
    question: 'Which animal is known for having a long trunk?',
    options: ['Elephant', 'Tiger', 'Giraffe', 'Panda'],
    correctAnswer: 0,
    explanation: 'Elephants are known for their long trunks.',
  ),
  QuestionModel(
    question: 'How many sides does a hexagon have?',
    options: ['5', '6', '7', '8'],
    correctAnswer: 1,
    explanation: 'A hexagon has six sides.',
  ),
  QuestionModel(
    question: 'Which ocean is the largest?',
    options: [
      'Atlantic Ocean',
      'Indian Ocean',
      'Arctic Ocean',
      'Pacific Ocean',
    ],
    correctAnswer: 3,
    explanation: 'The Pacific Ocean is the largest ocean on Earth.',
  ),
  QuestionModel(
    question: 'What is the capital of France?',
    options: ['Madrid', 'Rome', 'Paris', 'Berlin'],
    correctAnswer: 2,
    explanation: 'Paris is the capital city of France.',
  ),
];