import 'package:flutter/material.dart';

void main() => runApp(BouncingBallApp());

class BouncingBallApp extends StatefulWidget {
  @override
  _BouncingBallAppState createState() => _BouncingBallAppState();
}

class _BouncingBallAppState extends State<BouncingBallApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: const Offset(20, 100),
        child: Container(
          width: 100,
          height: 100,
          decoration:
              BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
