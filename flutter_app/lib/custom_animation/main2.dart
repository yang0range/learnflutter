import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math';
import 'package:flutter/services.dart';
/**
 * GestureDetector 澶勭悊鎵嬪娍
 */
// ignore: argument_type_not_assignable
void main() {
  /**
   * Center鎺т欢浣垮叾瀛愭帶浠跺湪涓�闂翠綅缃�
   * Text鎺т欢鏄剧ず鍚勭�嶆枃鏈�
   * runApp鍑芥暟灏嗘牴鎺т欢鏄剧ず鍦ㄥ睆骞曚笂
   */
  runApp(new MaterialApp(
    title: "鎴戠殑搴旂敤",
    home: new MyButton(),
  ));
}

class MyButton extends StatelessWidget {
 
var map = Map();

  @override
  Widget build(BuildContext context) {
    //GestureDetector骞朵笉鍏锋湁鏄剧ず鏁堟灉锛岃€屾槸妫€娴嬬敱鐢ㄦ埛鍋氬嚭鐨勬墜鍔�(鐐瑰嚮鎷栧姩鍜岀缉鏀�)
    return new GestureDetector(
      //鍙戠敓鐐瑰嚮浜嬩欢鍚庡洖璋�
      onTap: () {
        print("鐐瑰嚮浜嗗睆骞�");
      },
      //杩欓噷鏄�鎵嬫寚鎸変笅鐨勬椂鍊欒皟鐢ㄦ�ゅ嚱鏁帮紝璇ュ嚱鏁颁細浼犻€掍竴涓猟eatil鍖呭惈鍧愭爣淇℃伅鐨勫弬鏁�
      onTapDown: (detail){

        print(detail.globalPosition.dx);
        print(detail.globalPosition.dy);
        map[detail.globalPosition.dx as String]= detail.globalPosition.dy as String; 
        // list.add(new MyPainter());
        //鍦ㄨ繖閲屾坊鍔犵粍浠讹紝骞堕噸鏂扮粯鍒剁晫闈�
      },
      //鍙戠敓鍙屽嚮鏃堕棿鍚庡洖璋�
      onDoubleTap: (){
        print("鍙屽嚮浜嗗睆骞�");
      },
  //闀挎寜浜嬩欢
      onLongPress: (){
        print("闀挎寜灞忓箷");
      },
      child: new Container(
        child:  Column(
          children: <Widget>[
            CustomPaint( painter:MyPainter(map) ,),
          ],
        ),
        height: 36.0,
        padding: const EdgeInsets.all(0.0),
        //涓婁笅宸﹀彸閮藉亸绉�8鍍忕礌杈硅窛
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        //symmetric鐨勫弬鏁版槸鍙�閫夌殑 姘村钩鏂瑰悜
//        鑳屾櫙瑁呴グ
        decoration: new BoxDecoration(
          //鍦嗚�掑拰棰滆壊
        borderRadius: new BorderRadius.circular(5.0),
            color: Colors.white),
   
      ),
    );
  }
}


class MyPainter extends CustomPainter{
  var map ;
  MyPainter(this.map);
  Path _path = Path();
    @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
  ..color = Colors.red
  ..strokeCap = StrokeCap.round 
  ..isAntiAlias = true 
  ..strokeWidth = 15.0; 

    _paint.style = PaintingStyle.stroke; // 鐢荤嚎妯″紡
    _path.addArc(new Rect.fromLTWH(50, 50, 50, 50), 135.0 * (pi / 180.0), 225.0 * (pi / 180.0));
    _path.addArc(new Rect.fromLTWH(100, 50, 50, 50), 180.0 * (pi / 180.0), 225.0 * (pi / 180.0));
    _path.lineTo(100, 140);
    _path.lineTo(58, 93);
    canvas.drawPath(_path, _paint);

    _path.addArc(new Rect.fromLTWH(50, 50, 50, 50), 135.0 * (pi / 180.0), 225.0 * (pi / 180.0));
    _path.addArc(new Rect.fromLTWH(100, 50, 50, 50), 180.0 * (pi / 180.0), 225.0 * (pi / 180.0));
    _path.lineTo(100, 140);
    _path.lineTo(58, 93);
    canvas.drawPath(_path, _paint);
    // ui.Image image = Icon(Icons.menu) as ui.Image;
    // canvas.drawImage(image, new Offset(0, 0), _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
  Future<ui.Image> imageFromFilePath(String filePath) async {
  var byteData = await rootBundle.load(filePath);
  Uint8List lst = Uint8List.view(byteData.buffer);
  var codec = await ui.instantiateImageCodec(lst);
  var nextFrame = await codec.getNextFrame();
  return nextFrame.image;
}
}




















// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: 'MaterialApp',
//       //璺�鐢卞姛鑳斤紝涔熷氨鏄�鎸囧畾璺�鐢卞�瑰簲鐨勯〉闈�锛岀浉褰撲笌android涓�鐨刟ctivity
//       routes: {
//           '/other':(BuildContext context) => OtherPage()
//       },
//       //涓囦簨涓囩墿閮芥槸缁勪欢锛岃繖閲屽皢缁勪欢鎶藉彇鍑烘潵鍐欐垚涓€涓�绫�
//       home: HomePage(),
//     );
//   }
// }
// //鍒涘缓HomePage缁ф壙StatefulWidget
// class HomePage extends StatefulWidget{
//   /**
//    * 杩欐�典唬鐮佽〃绀虹殑鏄�鐨勯噸鍐檆reateState鏂规硶锛岃繑鍥炴寚瀹氱被鍨嬬殑鍙傛暟锛岃繖閲屾垜浠�灏嗗畠灞曞紑鍙�浠ヨ繖鏍风湅
   
//        @override
//       _HomePageSTate  createState(){
//            return  _HomePageSTate();
//       }
//       濡傛灉鏄�杩欐牱浣犺兘鐪嬪緱鎳備箞锛屾垜鐩镐俊娌￠棶棰橈紝灏辨槸鎶藉彇鍑烘潵浜嗚€屽凡
//    */
//    @override
//   _HomePageSTate  createState() => _HomePageSTate();
// }

// class _HomePageSTate extends State<HomePage>{
//   int _currentIndex = 0;
//   final _widgetOptions = [
//     Text("淇℃伅"),
//     Text("閫氳��褰�"),
//     Text('鍙戠幇'),
//     Text('鎴戠殑'),
//   ];
//   //杩欎釜鏂规硶鏄�蹇呴』瑕佸疄鐜扮殑
//     @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar:AppBar(
//         title: Text("MaterialApp瀹炰緥"),//鏍囬��
//         leading: Icon(Icons.backspace), //璁剧疆鍥炬爣
//         elevation: 0.0, //闃村奖
//         actions: <Widget>[
//           Icon(Icons.search),
//           Icon(Icons.more_vert),
//         ],
//       ) ,
//       body: Center(
//         //杩欓噷鐩稿綋浜庢椂浠庨泦鍚堜腑鏍规嵁index鑾峰彇鏁版嵁
//         child: _widgetOptions.elementAt(_currentIndex),

//       ),
//       //杩欎釜鏃舵偓娴�鐨勬寜閽�
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Navigator.pushNamed(context, '/other');
//         },
//         tooltip: '璺�鐢辫烦杞�',
//         foregroundColor: Color(0xffffffff),
//         backgroundColor: Color(0xff000000),
//         //闃村奖
//         elevation: 0.0,
//         child:Icon(Icons.arrow_forward),
//         //        shape: RoundedRectangleBorder(),
//       ),
//       //鎮�娴�鎸夐挳鐨勬樉绀轰綅缃�
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       //杩欎釜鏃跺簳閮ㄥ�艰埅鏍�
//       bottomNavigationBar: BottomNavigationBar(
//         items:[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             title: Text('淇℃伅')
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.contacts),
//             title: Text('閫氳��褰�'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.near_me),
//             title: Text('鍙戠幇'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             title: Text("鎴戠殑")
//           ),
//         ],
//         //榛樿�ょ殑閫夐」鍗＄殑鐐瑰嚮鏉＄洰
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         //閫夐」鍗＄殑鐐瑰嚮浜嬩欢
//         // onTap: (index){
//         //   setState(() {
//         //    _currentIndex =index; 
//         //   });
//         // },
//       ),
//     );
//   }
// }
// class OtherPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OtherPage'),
//       ),
//     );
//   }
// }
