import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';
//import 'package:app_iphone/test.dart';
//import 'package:app_iphone/test2.dart';
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}
class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  //
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];
  @override
  void initState(){
    super.initState();
    _tabController = TabController(
        length: tabs.length,
        vsync: this
    );
  }
  //

  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("App Name"),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        leading:Builder(builder: (context){
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white),
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()
//            tabs: [
//              Tab(text: 'tab1'),
//              Tab(text: 'tab2'),
//              Tab(text: 'tab3'),
//            ],
        ),//生产tab栏
//          bottom: const TabBar(
//              isScrollable: true,
//              tabs: [
//                Tab(text: 'tab1'),
//                Tab(text: 'tab2'),
//                Tab(text: 'tab3'),
//              ]
//          ),
      ),

      drawer: new MyDrawer(), //抽屉
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed:_onAdd
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(//tab切换
        controller: _tabController,
        children: tabs.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
//      body: SafeArea(
//        bottom: false,
//        child: TabBarView(
//          children: [
//            NewRoute(),
//          ],
//        ),
//      ),


    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
      print("Dependencies change");
      if(index == 1){
        print("router");
      }
      // print(index,'%d');
    });

  }
  void _onAdd(){
    print("test");
  }
}

//用于定义tab组件

//class _ScaffoldRouteState extends State<ScaffoldRoute>
//    with SingleTickerProviderStateMixin{
//  TabController _tabController; //需要定义一个Controller
//  List tabs = ["新闻", "历史", "图片"];
//}
//

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (
        // padding: const EdgeInsets.only(top: 20.0),
//      children:[
//        Text("This is new route"),
//      ]
        Text("This is new route")
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/logo.png',
                        //"assets/logo.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
