import 'package:flutter/material.dart';
import 'package:flutter_abc/util/SpUtils.dart';
import 'package:flutter_abc/pages/LoginPage.dart';
import 'package:flutter_abc/pages/CollectionPage.dart';
import 'package:flutter_abc/pages/AboutPage.dart';
import 'package:flutter_abc/constant/Constants.dart';
import 'package:flutter_abc/event/LoginEvent.dart';


class MePage extends StatefulWidget {

  @override
  _MeState createState() {
    return new _MeState();
  }

}

class _MeState extends State<MePage> {
  String userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getName();

    Constants.eventBus.on<LoginEvent>().listen((event) {
      //
    });
  }

  void _getName() async {
    SpUtils.getUserName().then((username) {
      setState(() {
        userName = username;
        print('name:' + userName.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget image = new Image.asset(
      'images/ic_launcher_round.png',
      width: 100.0,
      height: 100.0,
    );

    Widget loginButton = new RaisedButton(
        child: new Text(userName==null?"请登入":userName,
          style: new TextStyle(color: Colors.white)
        ),
        color: Theme.of(context).accentColor,
        onPressed: () async {
          await SpUtils.isLogin().then((isLogin) {
            if(isLogin) {
            } else {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                return new LoginPage();
              }));
            }
          });
        });

    Widget likeItem = new ListTile(
      leading: Icon(Icons.favorite),
      title: Text("喜欢的文章"),
      trailing:  Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
      onTap: () async {
        await SpUtils.isLogin().then((isLogin) {
          if(isLogin) {
            Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
              return new CollectionPage();
            }));
          } else {
            Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
              return new LoginPage();
            }));
          }
        });
      }
    );

    Widget aboutItem  = new ListTile(
      leading: const Icon(Icons.info),
      title: const Text('关于我们'),
      trailing:  Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
      onTap: () {

        Navigator.of(context).push(new MaterialPageRoute(builder: (context){
          return new AboutPage();
        }));
      },

    );

    Widget exitItem  = new ListTile(
      leading: const Icon(Icons.exit_to_app),
      title: const Text('退出登入'),
      trailing:  Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
      onTap: () {

        Navigator.of(context).push(new MaterialPageRoute(builder: (context){
          return new LoginPage();
        }));
      },

    );

    ListView listView = new ListView(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      children: <Widget>[
        image,
        loginButton,
        likeItem,
        aboutItem,
        exitItem
      ],
    );
    return listView;
  }
}
