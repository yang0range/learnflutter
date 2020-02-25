import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/md_widget/1-material_app.dart';

void main() => runApp(MaterialApp(home: HomePage()));

/**
 * 滑动删除
 */
class HomePage extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'items$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            onDismissed: (i) {
              items.removeAt(index);
            },
            movementDuration: Duration(milliseconds: 100),
            key: Key(item),
            child: ListTile(
              title: Text('$item'),
            ),
            background: Container(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
