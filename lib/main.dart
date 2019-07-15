import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(BouncingBallApp());

class BouncingBallApp extends StatefulWidget {
  @override
  _BouncingBallAppState createState() => _BouncingBallAppState();
}

class _BouncingBallAppState extends State<BouncingBallApp> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Point> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 5),vsync: this);
    animation = Tween<Point>(begin: Point(0, 0),end: Point(200, 200)).animate(controller)
                ..addStatusListener((status){
                  if(status == )
                });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBall(animation: animation,);
  }
}

class AnimatedBall extends AnimatedWidget{
  AnimatedBall({Key key,Animation animation}):
              super(key:key,listenable:animation);
  @override
  Widget build(BuildContext context) {
    final Animation<Point> animation = listenable;
    return Center(
      child: Transform.translate(
        offset:  Offset(animation.value.x.toDouble(), animation.value.y.toDouble()),
        child: Container(
          width: 100,
          height: 100,
          decoration:
              BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
        ),
      ),
    );;
  }

}
