import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/md_widget/1-material_app.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SimpleDialog(
              title: Text("对话框标题"),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('选项一'),
                  onPressed: () {
                    print("选项1");
                  },
                ),
                SimpleDialogOption(
                  child: Text('选项三'),
                  onPressed: () {
                    print("选项3");
                  },
                ),
                RaisedButton(
                  child: Text("删除"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("提示"),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text("是否删除"),
                                  Text("删除账号不会回复")
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("确定"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text("取消"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  },
                )
              ],
            ),
            SimpleDialog(
              title: Text("对话框标题"),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('选项一'),
                  onPressed: () {
                    print("选项1");
                  },
                ),
              ],
            ),
            SimpleDialog(
              title: Text("对话框标题"),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('选项二'),
                  onPressed: () {
                    print("选项2");
                  },
                )
              ],
            ),
            SimpleDialog(
              title: Text("对话框标题"),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('选项三'),
                  onPressed: () {
                    print("选项3");
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
