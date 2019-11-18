import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';
import 'package:app_iphone/test.dart';
//import 'package:app_iphone/test2.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:app_iphone/Model/get_data.dart';
import 'package:app_iphone/Model/testjson.dart';
import 'package:app_iphone/Model/json_entity.dart';
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
  List tabs = ["电影", "音乐", "书籍"];
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

        leading:Builder(builder: (context){
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()
        ),//生产tab栏

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
          //print(e);
          if(e=="电影"){
            return Container(
              alignment: Alignment.center,
              child:NewRoute1(),
            );
          }else if(e=='音乐'){
            return Container(
              alignment: Alignment.center,
              child:NewRoute2(),
            );
          }else if(e=='书籍'){
            return Container(
              alignment: Alignment.center,
              child:NewRoute3(),
            );
          }
          return Container(
            alignment: Alignment.center,
            child:NewRoute1(),
          );
        }).toList(),
      ),

    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
     // print(index);
      print("Dependencies change");
      if(index == 1){
        print("router");

      }
      // print(index,'%d');
    });

  }
  void _onAdd() async{

    print("test");
  }
}


class NewRoute1 extends StatelessWidget {
  @override
//  Widget build(BuildContext context) {
//    return new douban_Movie();
//  }
  Widget build(BuildContext context) {
    return new douban_Movie();
  }
}

//电影

class douban_Movie extends StatefulWidget {

  @override
  createState() => new get_Movie();
}

class get_Movie extends State<douban_Movie>{
  var movie_data = null;
  void get_http_movie() async{
    print('xxx');
     String url = "https://douban-api.uieee.com/v2/movie/in_theaters?city=广州&start=0&count=10";
     print(url);
    Response response = await Dio().get(url);
    if(response.statusCode == 200){
      setState(() {
        print(response.data);
        movie_data = JsonEntity.fromJson(response.data);
        print('xxxxxxx21231');
        print(movie_data);
      });
    }
  }
  @override
  void initState() {
    print('1');
    super.initState();
    get_http_movie();
  }
  Widget _buildRow(int index) {
    print('3');
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListTile(
        title: Text(movie_data.subjects[index].title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(movie_data.subjects[index].images.small),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: movie_data == null
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
        itemCount: movie_data.subjects.length,
        itemBuilder: (BuildContext context, int index) => _buildRow(index),
        //子项的分割线
        separatorBuilder: (BuildContext context,int index) => Divider(),
      ),
    );
  }
}
//
class Randomimg extends StatefulWidget {
  @override
  createState() => new RandomimgState();
}

class RandomimgState extends State<Randomimg> {
//List<Null> _json = [];
 var _json = null;
  void getHttp() async {
    print('2');
    Response response = await Dio().get("https://douban.uieee.com/v2/music/search?q=%E6%9D%8E%E5%AE%97%E7%9B%9B&start=0&count=5");
    print(response);
    if(response.statusCode == 200){
      // print(response.data);
      print('xxx22');
      setState((){
        _json = test.fromJson(response.data);
      });
    }else{
      print("err code $response.statusCode");
    }
  }
 @override
 void initState() {
   print('1');
   print(this);
   super.initState();
   // this.getHttp();
   getHttp();
 }
  Widget _buildRow(int index) {
    print('3');
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListTile(
        title: Text(_json.musics[index].title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_json.musics[index].image),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    print('4');
    return Scaffold(
      body: _json == null
      ? Center(child: CircularProgressIndicator())
      : ListView.separated(
        itemCount: _json.musics.length,
        itemBuilder: (BuildContext context, int index) => _buildRow(index),
        //子项的分割线
        separatorBuilder: (BuildContext context,int index) => Divider(),
      ),
    );
  }
}
//

class NewRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Randomimg();
  }
}



//


class NewRoute3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.only(top: 40.0),
        children:[
          Text("This is new route3"),
        ]
      //Text("This is new route")
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
