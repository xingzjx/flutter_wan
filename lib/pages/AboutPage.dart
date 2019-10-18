import 'package:flutter/material.dart';


class AboutPage extends StatefulWidget {

  @override
  _LoginState createState() {
    return new _LoginState();
  }

}

class _LoginState extends State<AboutPage> {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
            primaryColor: Colors.red,
            accentColor: Colors.blue

        ),
        home: new Scaffold(
            appBar: new AppBar(
                title: new Text(
                    "about"
                )
            ),

        )
    );
  }
}
