import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainTas(),
  ));
}

class MainTas extends StatefulWidget {
  const MainTas({Key? key}) : super(key: key);

  @override
  State<MainTas> createState() => _MainTasState();
}

class _MainTasState extends State<MainTas> {
  int leftNumberRandom = 1;
  int rightNumberRandom = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Tas Online",style: TextStyle(color: Colors.black87,fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
            quarterTurns:2 ,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
              ),
              onPressed: () {
                setNum();
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Start",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/num$leftNumberRandom.png", width: 180),
              Image.asset("images/num$rightNumberRandom.png",
                  width: 180),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background
            ),
            onPressed: () {
              setNum();
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Start",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setNum() {
    setState(() {
      AudioCache().play('dice.wav');
      rightNumberRandom = Random().nextInt(6) + 1;
      leftNumberRandom = Random().nextInt(6) + 1;
    });
  }
}
