import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutPageState();
  }
}

class AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        title: Text('关于'),
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            FlutterLogo(
              size: 100.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
              constraints: BoxConstraints(
                  maxHeight: double.infinity,
                  minHeight: 50.0
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: Divider.createBorderSide(
                        context, color: Colors.grey, width: 0.6),
                  )
              ),
              child: Row(
                //为了数字类文字居中
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '作者：陶承兴',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '记录生活点滴的小本本（不准用于记仇！）',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),)
      ,
    );
  }
}