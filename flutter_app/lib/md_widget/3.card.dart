import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/md_widget/2.dialog.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DemoApp",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardApp"),
        leading: Icon(Icons.payment),
      ),
      body: ListView(
        children: <Widget>[
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
        ],
      ),
    );
  }

  Card buildCard() {
    return Card(
      child: Column(
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(50))),
            child: Image.asset(
              "assets/images/one.jpg",
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Icon(Icons.payment),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "这个真好看",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "99",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "66",
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.favorite)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
