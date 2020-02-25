import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      routes: {'/other': (BuildContext context) => OtherPage()},
//      initialRoute: '/other',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _widgetOptions = [
    Text('信息'),
    Text('通讯录'),
    Text('发现'),
    Text('我'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialApp示例'),
        centerTitle: true,
        //是否居中
        elevation: 0,
        //阴影
        actions: <Widget>[Icon(Icons.more), Icon(Icons.search)],
        leading: Icon(Icons.star),
      ),

      body: _widgetOptions.elementAt(_currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/other');
        },
        tooltip: '路由跳转',
        //长按提示
        foregroundColor: Color(0xffffffff),
        backgroundColor: Color(0xff000000),
        //阴影
        elevation: 0.0,
        child: Icon(Icons.arrow_forward),
//        shape: RoundedRectangleBorder(),
      ),
      //centerDocked
      //centerFloat
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('信息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我'),
          ),
        ],
        currentIndex: _currentIndex,
        //默认 shifting
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtherPage'),
      ),
      drawer: Drawer(
//        elevation: 0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Demo"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://github.com/yang0range/flutterfile/blob/master/flutter.png'),
              ),
              accountEmail: Text("yangzcorange@163.com",style:
                TextStyle(
                  color: Colors.black
                ),),
              otherAccountsPictures: <Widget>[Icon(Icons.camera_alt)],
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/one.jpg"))),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Demo"),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Demo"),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Demo"),
            ),
            AboutListTile(
              icon: Icon(Icons.error),
              child: Text("关于"),
              applicationName: 'Demo_Yang',
              applicationVersion: '1.0',
            )
          ],
        ),
      ),
    );
  }
}
