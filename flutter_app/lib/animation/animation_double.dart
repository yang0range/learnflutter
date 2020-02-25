import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//动画两种 1.补间动画 2.物理动画
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnim;
  AnimationController _animationController;
  String _animValue;

  //四种状态
  //1. dismissed 初始
  //2 forward 从头到尾
  //3.reverse 从尾到头
  //4、complete //完成
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..forward();
    _doubleAnim = Tween(begin: 2.0, end: 200.0).animate(_animationController)
      ..addListener(() {
        print(_doubleAnim.value.toString());
        setState(() {});
      })
      ..addStatusListener((status) {
        print('$status');
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: _doubleAnim.value,
        height: _doubleAnim.value,
        color: Colors.blue,
      )),
    );
  }
}
