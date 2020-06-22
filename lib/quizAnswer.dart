import 'package:flutter/material.dart';
import 'quiz.dart';

class QuizAnswerButton extends StatefulWidget {
  final Quiz quiz;
  QuizAnswerButton({this.quiz});

  @override
  QuizAnswerButtonState createState() => QuizAnswerButtonState(quiz: quiz);
}

class QuizAnswerButtonState extends State<QuizAnswerButton> {
  String answerText = 'null';
  Quiz quiz;
  Color color = Colors.blue;

  QuizAnswerButtonState({this.quiz}) {
    this.quiz.registerButtonState(this);
  }

  void updateButton({String newText, Color color}) {
    setState(() {
      this.answerText = newText ?? this.answerText;
      this.color = color ?? this.color;
    });
  }

  void resetButton() {
    color = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 150,
        maxWidth: 150,
      ),
      margin: EdgeInsets.all(5),
      child: ButtonTheme(
        height: 150,
        minWidth: 150,
        child: FlatButton(
          child: Container(
            child: Text(
              answerText,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: () {
            quiz.selectAnswer(this.answerText, this);
          },
          color: color,
        ),
      ),
    );
  }
}
