import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:orientation/orientation.dart';
import 'ui/home.dart';
import 'utils/time_utils.dart';

void main() {
 // OrientationPlugin.forceOrientation(DeviceOrientation.landscapeRight);
 // SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());

  // 透明状态栏
//  if (Platform.isAndroid) {
//    SystemUiOverlayStyle systemUiOverlayStyle =
//        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Toast三方库包裹最外层
    return OKToast(
        child:
        MaterialApp(

          title: '日记本',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: MyHomePage(),
        ),
        backgroundColor: Colors.black54,
        textPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 默认选中第一项
  int _selectedIndex = 0;

  var ttime=TimeUtils.getLoveTime(new DateTime.now());
  var _pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print(_pageController.position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
  // 构建页面主体
  _buildBody() {
    //SafeArea包裹，保证不会在刘海屏等屏幕下出现裁剪、适配
    return SafeArea(
        child: Stack(
          children: <Widget>[
            // PageView实现引导页页面切换
            PageView(
              // 监听控制类
              controller: _pageController,
              onPageChanged: _onSelectChanged,
              children: <Widget>[
                // 引导页第一个页面
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey,
                  //  border: new Border.all(width: 2.0, color: Colors.red),
                  //  borderRadius: new BorderRadius.all(new Radius.elliptical(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height)),
                    image: DecorationImage(
                      image: AssetImage("image/bg3.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    alignment: Alignment.center,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                       new Container(
                           width: 320,
                           height: 80,
                            decoration: new BoxDecoration(
                              //背景
                              color: Colors.white,
                              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                              //设置四周边框
                              border: new Border.all(width: 1, color: Colors.red),
                            ),
                            child:
                        Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                      //  mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new ClipOval(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: new Image.asset(
                              "image/1.jpg",
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                          new Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: new ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6),bottomLeft: Radius.zero,bottomRight:Radius.zero),
                              child: new Icon(Icons.favorite,color: Colors.red,size: 50,),
                            ),
                          ),

                          new ClipOval(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: new Image.asset(
                              "image/2.jpg",
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ],
                      )

                        ),




                      Text(
                        '我们已经在一起',

                        style: TextStyle(

                            color: Color.fromRGBO(255, 255, 102, 1), fontSize: 40),


                      ),

                      Text(
                        ttime,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 102, 1), fontSize: 34),
                      ),
                    ],


                  )

    ),
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey,
                    //  border: new Border.all(width: 2.0, color: Colors.red),
                    //  borderRadius: new BorderRadius.all(new Radius.elliptical(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height)),
                    image: DecorationImage(
                      image: AssetImage("image/bg4.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                child:
                ListView(
                  children: <Widget>[
                    getItem('2019-12-23 10:00:00','第一次见面','今天入职，在培训室'),
                    getItem('2019-12-29 19:33:00','第一次在饭店碰到','还加了一手好友，可惜这家饭店已经倒闭了'),
                    getItem('2020-01-1 14:24:00','给你送蛋糕吃','假装顺手顺路'),
                    getItem('2020-01-1 18:32:00','第一次一起出去吃饭','饭很难吃，人很好看'),
                    getItem('2020-01-8 19:46:00','你第一来看我排练','你打台球的样子像极了我未来的女朋友'),
                    getItem('2020-01-12 21:11:00','第一次给你分享音乐','想让你睡得更好'),
                    getItem('2020-01-13 20:30:00','第一次喝你给的药','很苦很甜'),
                    getItem('2020-01-14 19:43:00','第一次给你煮红糖姜水喝','也是顺便的，对，蛋挞也是'),
                    getItem('2020-01-15 21:31:00','第一次给你分享视频',''),
                    getItem('2020-01-16 21:31:00','第一次和你单独在我寝室喝茶','给你泡了绿茶，送给你我顺便带回来的音乐盒'),
                    getItem('2020-01-18 21:35:00','我们在一起了',''),
                    getItem('2020-01-20 08:00:00','第一次去游乐场玩','阳光很甜'),
                    getItem('2020-01-20 08:00:00','第一次离别 ','刚在一起就要分开了'),
                    getItem('2020-01-22 22:39:00','我们换了情侣头像 ','粉粉嫩嫩的'),
                    getItem('2020-01-22 22:39:00','我们换了情侣头像 ','粉粉嫩嫩的'),
                    getItem('2020-01-22 22:39:00','我们换了情侣头像 ','粉粉嫩嫩的'),
                    getItem('2020-01-22 22:39:00','我们换了情侣头像 ','粉粉嫩嫩的'),
                    getItem('2020-01-22 22:39:00','我们换了情侣头像 ','粉粉嫩嫩的'),
                    getItem('2020-01-22 22:39:00','我们换了情侣头像 ','粉粉嫩嫩的'),
                    getItem('2020-01-22 22:39:00','我们换了情侣头像 ','粉粉嫩嫩的'),
                    getItem('2020-01-22 22:39:00','我们换了情侣头像 ','粉粉嫩嫩的'),

                  ],
                ),
                ),

                // 引导页第二个页面
//                Container(
//                  color: Color.fromRGBO(232, 229, 222, 1),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        '简约至尚',
//                        style: TextStyle(
//                            color: Color.fromRGBO(72, 186, 249, 1), fontSize: 22),
//                      ),
//                      SizedBox(
//                        height: 10,
//                      ),
//                      Text(
//                        '从内到外力求简约、精美、个性......',
//                        style: TextStyle(
//                            color: Color.fromRGBO(66, 84, 94, 1), fontSize: 20),
//                      )
//                    ],
//                  ),
//                ),
                // 引导页第三个页面
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey,
                    //  border: new Border.all(width: 2.0, color: Colors.red),
                    //  borderRadius: new BorderRadius.all(new Radius.elliptical(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height)),
                    image: DecorationImage(
                      image: AssetImage("image/bgx.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                //  color: Color.fromRGBO(232, 229, 222, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '我喜欢冬天的雪\n'
                            '      雪后的光\n'
                            '和任何时候的你\n',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 102, 1), fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          toPage();
                        },
                        child: Text(
                          '开始体验之旅>>',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 102, 1), fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // 绘制引导页的三个圆点指示器
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (_selectedIndex == 0)
                              ? Colors.white70
                              : Colors.black12)),
                  Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (_selectedIndex == 1)
                              ? Colors.white70
                              : Colors.black12)),
                  Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (_selectedIndex == 2)
                              ? Colors.white70
                              : Colors.black12))
                ],
              ),
            )
          ],
        ));
  }



  void _onSelectChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 切换
  void setPageViewItemSelect(int indexSelect) {
    _pageController.animateToPage(indexSelect,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  toPage() {
    //跳转并关闭当前页面
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) {
        return HomePage();
      }),
          (route) => route == null,
    );
  }


  Widget getItem(var s1,var s2,var s3) {
    return Container(
      height: 70,
      child: Row(
        children: <Widget>[
          Container(
            height: 70,width: MediaQuery.of(context).size.width/3.8,
           child: oneItem(s1),
           ),

          Container(
            height: 70,
            width: 20,
            child: leftItem(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: rightItem(s2,s3),
          ),
        ],
      ),
    );
  }
  Widget oneItem(var s1){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            s1,
            style: TextStyle(color: Colors.black38),
          ),
        ),



      ],
    );

  }
  Widget leftItem() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 1),
          child: VerticalDivider(
            thickness: 2,
            color: Colors.red,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0, top: 25),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purpleAccent,
            ),
          ),
        ),
      ],
    );
  }

  Widget rightItem(var s2,var s3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Text(s2),
//              Padding(
//                padding: const EdgeInsets.only(left: 20),
////                child: Text(
////                  '2020-08-07 18:00:00',
////                  style: TextStyle(color: Colors.black38),
////                ),
//              ),
            ],
          ),
        ),
        Text(
          s3,
          style: TextStyle(color: Colors.black54, fontSize: 12),
        ),
        Container(
            width: 200,
            child: Divider(
              height: 24,
            )),
      ],
    );
  }
}