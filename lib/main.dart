import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuizPage()));
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
            )));
  }
}

class QuizPage extends StatelessWidget {
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
                QuizAnswerButton(),
                QuizAnswerButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuizAnswerButton(),
                QuizAnswerButton(),
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

class QuizAnswerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ButtonTheme(
        height: 150,
        minWidth: 150,
        child: FlatButton(
          child: Text('data'),
          onPressed: () {},
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
