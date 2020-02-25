import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  List<Offset> points = List();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      child: GestureDetector(
        onPanDown: (details){
          setState(() {
            RenderBox box = context.findRenderObject();
            Offset offset = box.globalToLocal(details.globalPosition);
            points.add(offset);
          });
        },
        child: CustomPaint(
            painter: HeartPainter(points, 30, 40)
        ),
      ),
    );
  }
}

class HeartPainter extends CustomPainter{
  List<Offset> points;
  int width;
  int height;
  Path heartPath;
  HeartPainter(this.points, this.width, this.height):
  assert(width>0),
  assert(height>0){
    _initHeartPath();
  }
  Paint _paint = Paint()
    ..color = Color(0xffff0000)
    ..isAntiAlias = true
    ..style = PaintingStyle.fill;
  @override
  void paint(Canvas canvas, Size size) {
    points.forEach((offset){
      canvas..save()
        ..translate(offset.dx - 15, offset.dy - 14)
        ..drawPath(heartPath, _paint)
        ..restore();
    });
  }
  _initHeartPath(){
    heartPath = new Path()
      ..moveTo(width / 2, height / 4)
    ..cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12)
    ..moveTo(width / 2, height / 4)
    ..cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5,
        width / 2, (height * 7) / 12);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}

