import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: quizzlerApp(),
        ),
      ),
    );
  }
}

class quizzlerApp extends StatefulWidget {
  @override
  _quizzlerAppState createState() => _quizzlerAppState();
}

class _quizzlerAppState extends State<quizzlerApp> {
  //A list that stores the widgets for correct and wrong submissions
  List<Widget> scoreKeeper = [];
  void addResponse(int submission) {
    //submission = 1 for correct and 0 for incorrect
    if (submission == 1) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      print('here2');
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
  }

  List<String> questions = ['What is your name', 'Answer is false'];
  List<bool> answers = [true, false];

  int currIndex = 0; //Stores the index of displayed question

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              questions[currIndex],
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
          color: Colors.green,
          child: TextButton(
            onPressed: () {
              setState(() {
                //Means user submitted answer to question at currIndex as true
                if (answers[currIndex]) {
                  addResponse(1);
                } else {
                  addResponse(0);
                }
                currIndex++;
                //TODO if all questions are done , try something else
              });
            },
            child: Text(
              'True',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
          color: Colors.red,
          child: TextButton(
            onPressed: () {
              setState(() {
                if (!answers[currIndex]) {
                  addResponse(1);
                } else {
                  addResponse(0);
                }
                currIndex++;
              });
            },
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
