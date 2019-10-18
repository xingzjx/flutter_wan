import 'package:flutter/material.dart';


class CollectionPage extends StatefulWidget {

  @override
  _LoginState createState() {
    return new _LoginState();
  }

}

class _LoginState extends State<CollectionPage> {


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
                    "collection"
                )
            ),

        )
    );
  }
}
