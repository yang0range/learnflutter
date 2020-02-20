
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SevenApp());

class SevenApp extends StatefulWidget {
  @override
  _SevenAppState createState() => _SevenAppState();
}

class _SevenAppState extends State<SevenApp> {
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  String _userName;
  String _password;

  void _login() {
    var _loginForm = _loginKey.currentState;
    if (_loginForm.validate()) {
      _loginForm.save();
      print("name:$_userName,password:$_password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _loginKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "请输入用户名"),
                    onSaved: (value) {
                      print("$value");
                      _userName = value;
                    },
                    onFieldSubmitted: (value) {
                      print("$value");
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "请输入密码"),
                    obscureText: true,
                    onSaved: (value) {
                      print("$value");
                      _password = value;
                    },
                    validator: (value) {
                      return value.length < 4 ? "密码长度过段" : null;
                    },
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    margin: const EdgeInsets.all(20),
                    child: RaisedButton(
                      onPressed: () {
                        _login();
                      },
                      child: Text("登录"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
