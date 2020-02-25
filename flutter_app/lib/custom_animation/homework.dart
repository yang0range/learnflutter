import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Offset> points = List();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: GestureDetector(
          onPanDown: (details) {
            setState(() {
              RenderBox mBox = context.findRenderObject();
              Offset offset = mBox.globalToLocal(details.globalPosition);
              points.add(offset);
            });
          },
          child: CustomPaint(
            painter: Heart(points),
          )),
    );
  }
}

class Heart extends CustomPainter {
  List<Offset> points;

  Paint _paint = new Paint()
    ..color = Colors.red
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 5.0
    ..style = PaintingStyle.fill;

  Heart(this.points);

  @override
  void paint(Canvas canvas, Size size) {
//    canvas.save();
//    canvas.translate(40, 40);
//    canvas.drawPath(_getPath(), _paint);
//    canvas.restore();
    for (Offset value in points) {
      canvas.save();
      canvas.translate(value.dx - 10, value.dy - 15);
      canvas.drawPath(_getPath(), _paint);
      canvas.restore();
    }
  }

  Path _getPath() {
    var width = 20;
    var height = 30;
    Path path = new Path();
    path.moveTo(width / 2, height / 4);
    path.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    path.moveTo(width / 2, height / 4);
    path.cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5, width / 2,
        (height * 7) / 12);
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
