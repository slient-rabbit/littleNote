import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/search.dart';
import 'package:flutter_app/utils/note_db_helper.dart';
import 'package:flutter_app/utils/tost_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/ui/twoPage.dart';
import 'package:flutter_app/ui/notePage.dart';

import 'calendar.dart';
import 'center.dart';
import 'list.dart';
import 'write.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // 默认选中第一项
  int _selectedIndex = 0;
  var _pageController = new PageController(initialPage: 0);
  int last = 0;
  int index = 0;

  NoteDbHelper noteDbHelpter;

  @override
  void initState() {
    super.initState();
    noteDbHelpter = NoteDbHelper();
    getDatabasesPath().then((string) {
      String path = join(string, 'notesDb.db');
      noteDbHelpter.open(path);
    });
    _pageController.addListener(() {});
  }

  // 返回键拦截执行方法
  Future<bool> _onWillPop() {
    int now = DateTime.now().millisecondsSinceEpoch;
    print(now - last);
    if (now - last > 1000) {
      last = now;
      Toast.show("再按一次返回键退出");
      return Future.value(false); //不退出
    } else {
      return Future.value(true); //退出
    }
  }

  @override
  Widget build(BuildContext context) {
    // 要用WillPopScope包裹
    return WillPopScope(
      // 编写onWillPop逻辑
        onWillPop: _onWillPop,

        child: Material(
          child: SafeArea(
              child: Scaffold(
                appBar: PreferredSize(
                    child: Offstage(
                      offstage: _selectedIndex == 2 ? true : false,
                      child: AppBar(
                        backgroundColor: Colors.yellow,
                        title: Text('小本本'),

                        primary: true,
                        automaticallyImplyLeading: false,
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(Icons.search),
                            tooltip: '搜索',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return SearchPage(
                                      noteDbHelpter: noteDbHelpter,
                                    );
                                  }));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            tooltip: '日常记录',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return WritePage(
                                      noteDbHelpter: noteDbHelpter,
                                      id: -1,
                                    );
                                  }));
                            },
                          ),
                        ],
                      ),
                    ),
                    preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
                // 绑定数据
                body: SafeArea(
                    child: PageView(
                      // 监听控制类
                      controller: _pageController,
                      onPageChanged: _onItemTapped,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        ListPage(
                          noteDbHelpter: noteDbHelpter,
                        ),
                   //    CalendarPage(noteDbHelpter: noteDbHelpter),
                        twoPage(),
                      CenterPage(noteDbHelpter: noteDbHelpter),

                      ],
                    )),
                // 底部导航栏用CupertinoTabBar
                bottomNavigationBar: CupertinoTabBar(
                  // 导航集合
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.event_note,
                          color: Colors.blue[300],
                        ),
                        icon: Icon(Icons.event_note),
                        title: Text('小本本')),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.blue[300],
                        ),
                        icon: Icon(Icons.calendar_today),
                        title: Text('小日常')),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.person,
                          color: Colors.blue[300],
                        ),
                        icon: Icon(Icons.person),
                        title: Text('个人中心')),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: setPageViewItemSelect,
                ),
              )),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 底部点击切换
  void setPageViewItemSelect(int indexSelect) {
    _pageController.animateToPage(indexSelect,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}