import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;//是否保存状态

  int _indexCount = 0;

  void _addCount(){
    setState(() {
      _indexCount ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: new Center(
        child: new ListView(
          //控制方向 默认是垂直的
//           scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('相册', Icons.map,1),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('今天的心情', Icons.map,1),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('星座运势', Icons.map,1),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('进来玩呀', Icons.phone,2),

          ],
        ),
      ),
    );
  }
  Widget _getContainer(String test, IconData icon,int ) {
    return new Container(
      width: 160.0,
//      ListTile
      child: new ListTile(
//       显示在title之前
        leading: new Icon(icon),
//        显示在title之后
        //    trailing: new Icon(icon),
        title: new Text(test),
        //    subtitle:new Text("我是subtitle") ,
      ),
    );
  }
}



