import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: DetectorDemo(),
    ));

class DetectorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("onTap");
      },
      onDoubleTap: () {
        print("onDoubleTap");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(20),
        child: Text("Button"),
      ),
    );
  }
}
