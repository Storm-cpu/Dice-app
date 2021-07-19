import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int dice_a = 1;
  int dice_b = 1;
  String winer = "DRAW";
  void roll() {
    setState(() {
      dice_a = Random().nextInt(6) + 1;
      dice_b = Random().nextInt(6) + 1;
      if (dice_a > dice_b) winer = "PLAYER A WIN";
      if (dice_a < dice_b) winer = "PLAYER B WIN";
      if (dice_a == dice_b) winer = "DRAW";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$winer',
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 50),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Image.asset('images/dice$dice_a.png'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                        elevation: 0.0,
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      roll();
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Player A',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Image.asset('images/dice$dice_b.png'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                        elevation: 0.0,
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      roll();
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Player B',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
