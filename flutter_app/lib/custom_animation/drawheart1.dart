import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Offset> points = List<Offset>();

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        color: Color(0xffffffff),
        child: CustomPaint(
          painter: DrawHeartPainter(this.points),
        ),
      ),
      onPointerUp: (PointerEvent event) {
        setState(() {
          this.points.add(event.position);
        });
      },
    );
  }
}

class DrawHeartPainter extends CustomPainter {
  List<Offset> points;
  Paint _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;

  static Path path1 = Path();
  static Path path2 = Path();

  DrawHeartPainter(this.points) {
    var width = 20;
    var height = 30;
    path1.moveTo(width / 2, height / 4);
    path1.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5,
        width / 2, (height * 7) / 12);
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var point in points) {
      canvas.save();
      canvas.translate(point.dx, point.dy);
      canvas.drawPath(DrawHeartPainter.path1, _paint);
      canvas.drawPath(DrawHeartPainter.path2, _paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(DrawHeartPainter oldDelegate) {
    return true;
  }
}
