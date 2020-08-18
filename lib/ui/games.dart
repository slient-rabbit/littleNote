import 'package:flutter_app/game/game_widget.dart';
import 'package:flutter_app/snake/main.dart';

import 'calendar.dart';
import 'center.dart';
import 'list.dart';
import 'write.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/note_db_helper.dart';
import 'package:flutter_app/ui/game.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class games extends StatefulWidget {
  @override
  _gamesState createState() => new _gamesState();
}

class _gamesState extends State<games> with AutomaticKeepAliveClientMixin{
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
      appBar: new AppBar(
        /// 第一种方式
        /// 通过可监听点击的IconButton传入widget，
        /// 并在onPressed中处理drawer开启，借助于GlobalKey
        backgroundColor: Colors.yellow,
        leading: new IconButton(
          icon: new Container(
            padding: EdgeInsets.all(3.0),
            child: new Icon(Icons.arrow_back)
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('小游戏'),
      ),

      body: new Center(
        child: new ListView(
          //控制方向 默认是垂直的
//           scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('小恐龙方块', Icons.adb,1),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('灰机大战', Icons.airplanemode_active,2),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('贪吃蛇', Icons.all_inclusive,3),
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
        leading: new Icon(icon,color: Colors.blue,),
//        显示在title之后
        //  trailing: new Icon(icon),
        title: new Text(test),
        onTap: (){
          if(i==1)
            Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));
          else if(i==2)
            Navigator.push(context,MaterialPageRoute(builder: (context) => GameWidget()));
          else if(i==3)
            {
              int orientation = MediaQuery.of(context).orientation ==
                  Orientation.portrait
                  ? 0
                  : 1;
              Navigator.push(context,MaterialPageRoute(builder: (context) => Snake(orientation)));
            }


        },
      ),
    );
  }
}

