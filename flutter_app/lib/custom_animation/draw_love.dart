import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math'as Math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: DrawLoveWidget()
        )
      ),
    );
  }
}

class DrawLoveWidget extends StatefulWidget {
  @override
  _DrawLoveWidgetState createState() => _DrawLoveWidgetState();
}

class _DrawLoveWidgetState extends State<DrawLoveWidget> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        painter: DrawLovePainter(_offset),
      ),
      onTapDown: (detail) {
        setState(() {
          _offset = detail.globalPosition;
          print(" $_offset     ");
        });
      },
      //可移动
      onPanUpdate: (detail){
        setState(() {
          _offset = detail.globalPosition;
          print(" $_offset     ");
        });
      },
    );
  }
}


class DrawLovePainter extends CustomPainter{

  Offset offset;
  Path path;
  Paint _paint;
  DrawLovePainter(this.offset){
    path = Path();
    _paint = Paint();
    _paint.isAntiAlias = true;
    _paint.strokeWidth = 1;
    _paint.color = Colors.red;
    _paint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {

    if(offset == Offset.zero) return;

    double dx = offset.dx;
    double dy = offset.dy;
    print(" $dx      $dy");

    var list = List<Offset>();
    /*for(int i = 0 ; i < 360 ; i++){
      double angle = i*2*Math.pi/360;
      double x = (4*10 + 10*(2*Math.cos(angle) - Math.cos(2*angle)))+ dx;
      double y = (4*10 + 10*(2*Math.sin(angle) - Math.sin(2*angle)))+ dy;
      list.add(Offset(x, y));
    }*/


    /** 画一个心 **/
    int i, j;
    double x, y, r;
    for (i = 0; i <= 90; i++) {
      for (j = 0; j <= 90; j++) {
        r = Math.pi / 45 * i * (1 - Math.sin(Math.pi / 45 * j))
            * 20;
        x = r * Math.cos(Math.pi / 45 * j)
            * Math.sin(Math.pi / 45 * i) + 320 / 2 ;
        y = -r * Math.sin(Math.pi / 45 * j) + 400 / 4 ;
        list.add(Offset(x/2-80+dx, y/2-100+dy));
      }
    }
    canvas.drawPoints(PointMode.points, list ,_paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
