import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(SecondApp());

class SecondApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//    debugPaintSizeEnabled = false;
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Image Demo"),
          ),
          body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //加载网络图片
                    Image.network(
                      "https://www.baidu.com/img/bd_logo1.png?where=super",
                      width: 150,
                      height: 150,
                    ),
                    //鸡仔Assets
                    Image.asset(
                      'assets/images/one.jpg',
                      width: 200,
                      height: 200,
                    ),
                    //如果加载不出来，看一下pubspec.yaml改没改
                    //Memory
                    MemoryImageWidget(),
                    //从文件加载图片
                    FileImageWidget(),
                  ],
                ),
              )),
        ));
  }
}

//快捷键stf
class MemoryImageWidget extends StatefulWidget {
  @override
  _MemoryImageWidgetState createState() => _MemoryImageWidgetState();
}

class _MemoryImageWidgetState extends State<MemoryImageWidget> {
  Uint8List bytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/images/one.jpg').then((data) {
      if (mounted) {
        setState(() {
          bytes = data.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _decoration = BoxDecoration(
      image: bytes == null ? null : DecorationImage(image: MemoryImage(bytes)),
    );
    return Container(
      width: 150,
      height: 150,
      decoration: _decoration,
    );
  }
}

class FileImageWidget extends StatefulWidget {
  @override
  _FileImageWidgetState createState() => _FileImageWidgetState();
}

class _FileImageWidgetState extends State<FileImageWidget> {
  File _image;

  Future getImge() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: _image == null
              ? Text('未选择图片！')
              : Image.file(
            _image,
            width: 200.0,
            height: 200.0,
          ),
        ),
        FlatButton(
          onPressed: getImge,
          child: Text(
            '选择图片',
            style: TextStyle(
              color: Color(0xff0000ff),
            ),
          ),
        ),
      ],
    );
  }
}
