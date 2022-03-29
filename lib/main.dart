import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

import 'question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      "questionText": "What is your favorite color?",
      "answer": [
        {'text': "Blue", 'score': 10},
        {'text': "Pink", 'score': 5},
        {'text': "Yellow", 'score': 3},
        {'text': "Red", 'score': 1}
      ],
    },
    {
      "questionText": "What's your favorite game?",
      "answer": [
        {'text': "Tennis", 'score': 10},
        {'text': "Swimming", 'score': 5},
        {'text': "Soccer", 'score': 3},
        {'text': "BasketBall", 'score': 1}
      ],
    },
    {
      "questionText": "Who is your favorite President?",
      "answer": [
        {'text': "Abacha", 'score': 10},
        {'text': "Buhari", 'score': 5},
        {'text': "Goodluck", 'score': 3},
        {'text': "Obasanjo", 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First app"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
