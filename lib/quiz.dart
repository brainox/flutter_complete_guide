import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<dynamic, dynamic>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]["questionText"],
        ),
        ...(questions[questionIndex]["answer"] as List<Map<dynamic, dynamic>>)
            .map((answer) =>
                Answer(() => answerQuestion(answer['score']), answer['text']))
            .toList()
      ],
    );
  }
}
