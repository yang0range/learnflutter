import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(FourApp());

class FourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Icon Button Demo"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Icon(Icons.ac_unit),
          SizedBox(
            height: 10,
            width: 10,
          ),
          IconButton(

            icon: Icon(Icons.accessibility),
            onPressed: () {
              print("IconButon");
            },
          ),
//          Container(
//            height: 200,
//            width: 200,
//            color: Colors.blue,
//          ),
          SizedBox(
          height: 20,
          width: 20,
        ),
        RaisedButton(
          onPressed: () {},
          child: Text("RaisedButton"),
        ),
        ],
      ),
    ),)
    ,
    );
  }
}
