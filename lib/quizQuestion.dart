import 'package:flutter/material.dart';
import 'quiz.dart';

class QuizQuestion extends StatefulWidget {
  final Quiz quiz;

  QuizQuestion({this.quiz});

  @override
  QuizQuestionState createState() => QuizQuestionState(quiz: quiz);
}

class QuizQuestionState extends State<QuizQuestion> {
  String questionText = 'null';
  Quiz quiz;

  QuizQuestionState({this.quiz}) {
    quiz.registerQuestionState(this);
  }

  void updateQuizQuestion({String questionText}) {
    setState(() {
      this.questionText = questionText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Text(questionText),
    );
  }
}

class QuestionModel{
  String questionText;
  String correctAnswer;
  List<String> answers;

  QuestionModel({this.questionText, this.correctAnswer, this.answers});
}