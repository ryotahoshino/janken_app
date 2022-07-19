import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String otherHand = '✊';
  String result = '引き分け';

  void selectHand(String selectedHand){
    myHand = selectedHand;
    computerHand();
    judge();
    setState((){});
  }

  void computerHand(){
    final randomNumber = Random().nextInt(3);
    otherHand = enemyHand(randomNumber);
  }

  String enemyHand(int randomNumber){
    if(randomNumber == 0){
      return '✊';
    }else if(randomNumber == 1){
      return '✌️';
    }else{
      return '✋';
    }
  }

  void judge(){
    if(myHand == otherHand){
      result = '引き分け';
    }else if (
      myHand == '✊' && otherHand == '✌️' ||
      myHand == '✌️' && otherHand == '✋' ||
      myHand == '✋' && otherHand == '✊'
    ){
      result = '勝ち';
    }else{
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけんゲーム'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              otherHand,
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
                myHand,
                style: TextStyle(
                  fontSize: 50,
                ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){
                      selectHand('✊');
                    },
                    child: Text(
                        '✊',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                    ),
                ),
                ElevatedButton(
                  onPressed: (){
                    selectHand('✌️');
                  },
                  child: Text(
                      '✌️',
                      style: TextStyle(
                      fontSize: 20,
                  ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    selectHand('✋');
                  },
                  child: Text(
                      '✋',
                      style: TextStyle(
                      fontSize: 20,
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
