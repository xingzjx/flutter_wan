import 'package:flutter/material.dart';
import 'package:flutter_abc/pages/HomePage.dart';
import 'package:flutter_abc/pages/TreePage.dart';
import 'package:flutter_abc/pages/MePage.dart';

class MainPage extends StatefulWidget {

  @override
  _MainState createState() {
    return new _MainState();
  }

}

class _MainState extends State<MainPage> {
  var _tabIndex = 0;
  List<BottomNavigationBarItem> _navigationViews;
  var appBarTitles = ['首页', '知识', '我的'];


  @override
  void initState() {
    super.initState();

    _navigationViews = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: new Text(appBarTitles[0]),
        backgroundColor: Colors.blue,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title: new Text(appBarTitles[1]),
        backgroundColor: Colors.blue,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: new Text(appBarTitles[2]),
        backgroundColor: Colors.blue,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blue

      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
              appBarTitles[_tabIndex]
          )
        ),
        body: new IndexedStack(
            children: <Widget>[new HomePage(),new TreePage(), new MePage()],
            index: _tabIndex,
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: _navigationViews
              .map((BottomNavigationBarItem navigationView) => navigationView)
              .toList(),
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              _tabIndex = index;
            });
          }
        )
      )
    );
  }

}


