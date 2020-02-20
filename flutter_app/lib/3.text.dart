import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(ThirdApp());

class ThirdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "这是个测试这是个测试这是个测试这是个测试这是个测试这是个测试",
                maxLines: 2,
                //TextOverfow阶段
                overflow: TextOverflow.ellipsis, //3个小点
                softWrap: true, //自动换行
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    text: '这个是富文本富文本富文本富文本',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '测试一下测试一下'),
                      TextSpan(
                          text: '点一下试一试',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              String url = 'http:www.baidu.com';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'error:$url';
                              }
                            }),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
