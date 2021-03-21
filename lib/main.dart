import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: QuizzlerApp(),
        ),
      ),
    );
  }
}

class QuizzlerApp extends StatefulWidget {
  @override
  _QuizzlerAppState createState() => _QuizzlerAppState();
}

class _QuizzlerAppState extends State<QuizzlerApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              'Here comes the question',
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
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
