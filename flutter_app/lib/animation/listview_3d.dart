import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var images = [
    'images/one.jpg',
    'images/one.jpg',
    'images/one.jpg',
    'images/one.jpg',
    'images/one.jpg',
    'images/one.jpg',
    'images/one.jpg',
    'images/one.jpg',
    'images/one.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListWheelScrollView(
        perspective: 0.003,
        diameterRatio: 2.0,
        itemExtent: MediaQuery.of(context).size.height*0.6,
        children: images
            .map((m) => Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        m,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 30.0,
                        left: 30.0,
                        child: Text(
                          '天之道',
                          style: TextStyle(
                              color: Color(0xffffffff), fontSize: 30.0),
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    ));
  }
}
