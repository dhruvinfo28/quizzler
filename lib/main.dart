import 'package:flutter/material.dart';
import 'questions.dart';
import 'questionBank.dart';

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
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
  }

  Quizz questionBank = Quizz();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              questionBank.getQuestionText(),
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
                if (questionBank.getAnswer()) {
                  addResponse(1);
                } else {
                  addResponse(0);
                }
                questionBank.nextQuestion(context, scoreKeeper);
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
                if (!questionBank.getAnswer()) {
                  addResponse(1);
                } else {
                  addResponse(0);
                }
                questionBank.nextQuestion(context, scoreKeeper);
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

//One thing to notice is that we can still change answers to questions from main.dart and that should not happen ,
// hence we make the questions a private member in Quizz class, a property of a class can be made private by adding an
// underscore in the front

//Understanding polymorphism
//Suppose a class inherits from a parent and we want a different implementation for a method we inherited from the base
//class , here is when polymorphism comes into play
//We use @override above the method implementation
//class Car {
//   int seats = 5;
//   void drive(){print('Wheels turn');
// }

//class FloatingCar extends Car{
//
//  @override
//  void drive(){ super.drive(); print('Car glides'); }  // Here we improved the functionality of drive
//                                                          that was inherited from the base class, we could simply
//                                                          remove it too by not calling super.drive();
// }
