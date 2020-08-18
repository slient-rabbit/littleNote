
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/games.dart';
import 'package:flutter_app/ui/red_style_page.dart';
import 'package:flutter_app/game/game_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/ui/calendar.dart';
class twoPage extends StatefulWidget {
  @override
  _TwoPageState createState() => new _TwoPageState();
}

class _TwoPageState extends State<twoPage> with AutomaticKeepAliveClientMixin{
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
            _getContainer('小游戏', Icons.videogame_asset,1),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('小运势', Icons.star_border,2),
            Container(height: 20.0,decoration: new BoxDecoration( color: Colors.black12),),
            _getContainer('小日子', Icons.today,3),
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
            Navigator.push(context,MaterialPageRoute(builder: (context) => games()));
          else if(i==3)
            Navigator.push(context,MaterialPageRoute(builder: (context) => RedStylePage()));
        },
      ),
    );
  }
}

