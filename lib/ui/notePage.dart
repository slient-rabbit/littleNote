import 'calendar.dart';
import 'center.dart';
import 'list.dart';
import 'write.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/note_db_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class game extends StatefulWidget {
  @override
  _gameState createState() => new _gameState();
}

class _gameState extends State<game> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;//是否保存状态
  var _pageController = new PageController(initialPage: 0);
  int last = 0;
  int _indexCount = 0;
  NoteDbHelper noteDbHelpter;

  @override

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
            _getContainer('小恐龙方块', Icons.map,1),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('。。。', Icons.phone,2),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('。。。', Icons.map,3),
          ],
        ),
      ),

    );
  }
  Widget _getContainer(String test, IconData icon,int i) {
    return new Container(
      width: 160.0,
//      ListTile
      child: new ListTile(
//       显示在title之前
        leading: new Icon(icon),
//        显示在title之后
        //  trailing: new Icon(icon),
        title: new Text(test),
        onTap: (){
          if(i==1)
            Navigator.push(context,MaterialPageRoute(builder: (context) => game()));

        },
      ),
    );
  }
}

