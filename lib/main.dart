import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(
                child: Text('Play'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(),
                    ),
                  );
                },
                color: Colors.blue,
              ),
              FlatButton(
                child: Text('Leaderboard'),
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Quiz {
  String question;
  String correctAnswer;
  List anwers = new List();
  List buttons = new List();

  Quiz() {
    load();
  }

  void load() async {
    Map<String, dynamic> json =
        jsonDecode(await rootBundle.loadString('assets/quizes/quiz1.json'));
    this.question = json['question'];
    for (String s in json['incorrectAnswers']) {
      this.anwers.add(s);
    }
    this.anwers.add(json['correctAnswers'][0]);
    callAllButtons();
  }

  void registerButtonState(_QuizAnswerButtonState buttonState){
    buttons.add(buttonState);
  }

  void callAllButtons(){
    int counter = 0;
    for(_QuizAnswerButtonState button in buttons){
      button.updateButtonText(anwers[counter]);
      counter++;
    }
  }
}

class QuizPage extends StatelessWidget {
  final Quiz quiz = new Quiz();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QuizQuestion(),
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

class QuizQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Text('Question text?'),
    );
  }
}

class QuizAnswerButton extends StatefulWidget {
  final Quiz quiz;
  QuizAnswerButton({this.quiz});

  @override
  _QuizAnswerButtonState createState() => _QuizAnswerButtonState(quiz: quiz);
}

class _QuizAnswerButtonState extends State<QuizAnswerButton> {
  String questionText = 'null';
  Quiz quiz;
  Color color = Colors.blue;

  _QuizAnswerButtonState({this.quiz}){
    this.quiz.registerButtonState(this);
  }

  void updateButtonText(String newText){
    setState(() {
      questionText = newText;
    });
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
              questionText,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: () {
            setState(() {
              color = getUpdatedColor(true);
            });
          },
          color: color,
        ),
      ),
    );
  }

  Color getUpdatedColor(bool answer) {
    return (answer) ? Colors.green : Colors.red;
  }
}
