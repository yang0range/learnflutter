import 'dart:math';

import 'package:flutter/material.dart';

//程序主函数，Flutter入口 这里参数需要传递“根”
void main() => runApp(FirstApp());

//快捷键stl
class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Demo"),
        ),
        body: Center(
          child: Container(
//            color: Colors.green,
            //背景色
            //fromLTRB(double left, double top, double right, double
            //bottom)：分别指定四个方向的填充。
            //all(double value) : 所有方向均使用相同数值的填充。
            //only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
            //symmetric({vertical, horizontal})：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。
            padding: EdgeInsets.fromLTRB(20, 10, 50, 70),
//            color:Color(0xffff000)
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.yellow,
                    width: 20.0
              ),borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Text(
              "Container",
              style: TextStyle(fontSize: 28, color: Colors.blue),
            ),
            transform: Matrix4.rotationZ(-pi/25),
          ),
        ),
      ),
    );
  }
}
