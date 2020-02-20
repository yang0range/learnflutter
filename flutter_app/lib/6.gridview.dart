import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SixApp());

class SixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("GridView Demo"),
          ),
          //交叉轴的个数
          body:
//        NormalGridView(),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    print("$index");
                    return ListTile(
                      leading: Icon(Icons.ac_unit),
                      title: Text("$index Demo"),
                    );
                  })),
    );
  }
}

class NormalGridView extends StatelessWidget {
  const NormalGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
//          scrollDirection: Axis.horizontal,
      childAspectRatio: 2 / 3, //宽高比
      children: List.generate(50, (index) {
        return Text(
          '$index',
          style: TextStyle(fontSize: 20),
        );
      }),
    );
  }
}
