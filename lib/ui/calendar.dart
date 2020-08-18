import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_calendar/controller.dart';
import 'package:flutter_custom_calendar/widget/calendar_view.dart';
import 'package:flutter_app/utils/note_db_helper.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    Key key,
    @required this.noteDbHelpter,
  }) : super(key: key);

  final NoteDbHelper noteDbHelpter;

  @override
  State<StatefulWidget> createState() {
    return CalendarPageState();
  }
}

class CalendarPageState extends State<CalendarPage> with AutomaticKeepAliveClientMixin{
  CalendarController calendarController;

  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
    calendarController.addMonthChangeListener(
          (year, month) {
        setState(() {});
      },
    );
    calendarController.addOnCalendarSelectListener((dateModel) {
      setState(() {});
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
        title: Text('日历'),
      ),

      body: CalendarViewWidget(
        calendarController: calendarController,
      )

    );


  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}