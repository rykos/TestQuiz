import 'package:flutter/material.dart';

class QuizPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}
class QuizState extends State<Quiz>{
  List<String> answers = new List();
  //
  QuestionTextState questionTextState;
  List<AnswerButtonState> answerButtonsStates;
  void updateQuestionText(){

  }
  void updateButtons(){
    int c = 0;
    for(var button in this.answerButtonsStates){
      button.updateText(this.answers[c]);
      c++;
    }
  }
  void registerButton(AnswerButtonState button){
    this.answerButtonsStates.add(button);
  }


  @override 
  Widget build(BuildContext context) {
    answers.add('1');
    answers.add('2');
    answers.add('3');
    answers.add('4');
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          QuestionText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnswerButton(
                quiz: this,
              ),
              AnswerButton(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnswerButton(),
              AnswerButton(),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                child: Text('Dawaj'),
                onPressed: (){updateButtons();}
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnswerButton extends StatefulWidget {
  final QuizState quiz;
  AnswerButton({this.quiz});
  @override 
  AnswerButtonState createState() => AnswerButtonState(this.quiz);
}
class AnswerButtonState extends State<AnswerButton> {
  String buttonText = 'null text';
  AnswerButtonState(QuizState quiz){
    quiz.answerButtonsStates.add(this);
  }

  void updateText(String value){
    setState(() {
      this.buttonText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 125,
        minWidth: 125,
        maxHeight: 125,
        maxWidth: 125,
      ),
      margin: EdgeInsets.all(5),
      child: FlatButton(
        child: Text(buttonText),
        color: Colors.blue,
        onPressed: () {},
      ),
    );
  }
}


class QuestionText extends StatefulWidget {
  @override
  QuestionTextState createState() => QuestionTextState();
}
class QuestionTextState extends State<QuestionText>{
  String text = 'null text';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.text),
    );
  }
}


class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: 0.5,
    );
  }
}
