import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(FiveApp());

class FiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView Demo"),
        ),
        body:
//        noramlListView(),
//        HorizontalListView(),
        ListView.builder(itemBuilder: (context, index) {
          print(index);
          if(index.isOdd){
            return Divider();
          }
          return ListTile(
            leading: Icon(Icons.favorite),
            title: Text("title"),
            subtitle: Text("subTitle"),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        }),
      ),
    );
  }


  ListView noramlListView() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("title"),
          subtitle: Text("subTitle"),
          trailing: Icon(Icons.print),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("title"),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("title"),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("title"),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("title"),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("title"),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("title"),
        ),
      ],
    );
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        //generate一次加载所有数据
        children: List.generate(400, (index) {
          return Text('$index', style: TextStyle(fontSize: 20),);
        }));
  }
}

