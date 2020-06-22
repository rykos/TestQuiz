import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_quiz/summary.dart';
import 'quizQuestion.dart';
import 'quizAnswer.dart';
import 'package:flutter/services.dart';

class QuizPage extends StatelessWidget {
  final Quiz quiz = new Quiz();

  @override
  Widget build(BuildContext context) {
    quiz.setContext(context);
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            QuizQuestion(quiz: quiz),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuizAnswerButton(quiz: quiz),
                QuizAnswerButton(quiz: quiz),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuizAnswerButton(quiz: quiz),
                QuizAnswerButton(quiz: quiz),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Quiz {
  List<QuestionModel> questions = new List();
  List buttons = new List(); //Registered buttons
  QuizQuestionState questionWidget; //Registered question widget
  bool answerSelected = false;
  BuildContext _context;

  Quiz() {
    load();
  }

  void setContext(BuildContext context) {
    this._context = context;
  }

  //Rework this ghetto
  void load() async {
    List<dynamic> json =
        jsonDecode(await rootBundle.loadString('assets/quizes/quiz1.json'));
    for (dynamic question in json) {
      String qText = question['question'];
      List<String> aTexts =
          (question['correctAnswers'] as List<dynamic>).cast<String>().toList();
      aTexts.shuffle();
      List<dynamic> answers =
          (question['incorrectAnswers'] as List<dynamic>).toList();
      answers.shuffle();
      answers = answers.take(3).cast<dynamic>().toList();
      answers.add(aTexts[0]);
      answers.shuffle();

      QuestionModel newQuestion = new QuestionModel(
          questionText: qText,
          correctAnswer: aTexts[0],
          answers: answers.cast<String>().toList());
      questions.add(newQuestion);
    }
    onLoaded();
  }

  void registerButtonState(QuizAnswerButtonState buttonState) {
    buttons.add(buttonState);
  }

  void registerQuestionState(QuizQuestionState questionState) {
    this.questionWidget = questionState;
  }

  void callAllButtons() {
    int counter = 0;
    for (QuizAnswerButtonState button in buttons) {
      button.updateButton(newText: questions[0].answers[counter]);
      counter++;
    }
  }

  void selectAnswer(String answer, QuizAnswerButtonState sender) {
    if (answerSelected) {
      nextQuestion();
      return;
    }
    if (answer == questions[0].correctAnswer) {
      sender.updateButton(color: Colors.green);
    } else {
      sender.updateButton(color: Colors.red);
    }
    answerSelected = true;
  }

  void onLoaded() {
    questionWidget.updateQuizQuestion(
        questionText: this.questions[0].questionText);
    callAllButtons();
  }

  void nextQuestion() {
    questions.removeAt(0);
    if (questions.length == 0) {
      finishGame();
      return;
    }
    onLoaded();
    for (QuizAnswerButtonState button in buttons) {
      button.resetButton();
    }
    answerSelected = false;
  }

  void finishGame() {
    Navigator.pop(_context);
    Navigator.push(
        _context,
        MaterialPageRoute(
          builder: (context) => SummaryPage(),
        ));
  }
}