import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: <Widget>[
                FlatButton(
                  child: Text('data'),
                  onPressed: () {},
                  color: Colors.blueAccent,
                ),
                FlatButton(
                  child: Text('data'),
                  onPressed: () {},
                  color: Colors.blueAccent,
                ),
                FlatButton(
                  child: Text('data'),
                  onPressed: () {},
                  color: Colors.blueAccent,
                ),
                FlatButton(
                  child: Text('data'),
                  onPressed: () {},
                  color: Colors.blueAccent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
