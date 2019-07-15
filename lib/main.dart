import 'dart:async';
import 'dart:math';

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
      appBar: AppBar(
        title: Text("Bouncing Ball"),
      ),
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
  double dx = 2;
  double dy = 2;
  Timer timer;
  @override
  void initState() {
    super.initState();
    double screenRight = widget.screenSize.width / 2 - 100;
    double screenBottom = widget.screenSize.height / 2 - 100;
    const twentyMillis = const Duration(milliseconds: 1000 ~/ 60);
    timer = Timer.periodic(twentyMillis, (timer) {
      setState(() {
        if (dx > screenRight || dx < -screenRight) {
          dx -= 2;
        } else if (dy > screenBottom || dy < -screenBottom) {
          dy -= 2;
        } else {
          dx += 2;
          dy += 2;
        }
      });
    });
  }

  void _moveBall() {
    _shouldMove = !_shouldMove;
    if (!_shouldMove) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _moveBall,
        child: Transform.translate(
          offset: Offset(dx, dy),
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
