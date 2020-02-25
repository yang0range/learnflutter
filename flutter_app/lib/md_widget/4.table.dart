import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/md_widget/2.dialog.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(50),
            1: FixedColumnWidth(80),
            2: FixedColumnWidth(50),
            3: FixedColumnWidth(50),
          },
          border: TableBorder.all(
            color: Colors.red,
            width: 1,
          ),
          children: const <TableRow>[
            TableRow(
              children: [
                Text("头像"),
                Text("姓名"),
                Text("年龄"),
                Text("身高")
              ]
            ),
            TableRow(
                children: [
                  Icon(Icons.portrait),
                  Text("2"),
                  Text("3"),
                  Text("4")
                ]
            ),
            TableRow(
                children: [
                  Icon(Icons.portrait),
                  Text("2"),
                  Text("3"),
                  Text("4")
                ]
            ),
            TableRow(
                children: [
                  Icon(Icons.portrait),
                  Text("2"),
                  Text("3"),
                  Text("4")
                ]
            ),
            TableRow(
                children: [
                  Icon(Icons.portrait),
                  Text("2"),
                  Text("3"),
                  Text("4")
                ]
            ),
          ]
        ),
      ),
    );
  }
}
