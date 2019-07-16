import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bouncing Ball",
        home: BouncingBall());
  }
}

class BouncingBall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: GameScreen(
        screenSize: screenSize,
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  final Size screenSize;
  GameScreen({Key key, @required this.screenSize}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _shouldMove = false;
  double xStep = 2;
  double yStep = 2;
  double dx = 2;
  double dy = 2;
  Timer timer;

  void _moveBall() {
    _shouldMove = !_shouldMove;
    if (_shouldMove) {
      double screenRight = widget.screenSize.width / 2 - 50;
      double screenBottom = widget.screenSize.height / 2 - 50;
      const twentyMillis = const Duration(milliseconds: 1000 ~/ 60);
      timer = Timer.periodic(twentyMillis, (timer) {
        setState(() {
          if (dx > screenRight || dx < -screenRight) {
            xStep = -xStep;
            dx += xStep;
          } else if (dy > screenBottom || dy < -screenBottom) {
            yStep = -yStep;
            dy += yStep;
          } else {
            dx += xStep;
            dy += yStep;
          }
        });
      });
    } else {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(dx, dy),
        child: GestureDetector(
          onTap: _moveBall,
          child: Container(
            width: 100,
            height: 100,
            decoration:
                BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
