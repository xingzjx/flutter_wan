import 'package:flutter/material.dart';
import 'package:flutter_abc/pages/ArticleDetailPage.dart';

class ArticleItem extends StatefulWidget {

  var itemData;

  ArticleItem(var itemData) {
    this.itemData = itemData;
  }

  @override
  State<StatefulWidget> createState() {
    return new _ArticleItemState();
  }
}

class _ArticleItemState extends State<ArticleItem> {

  @override
  Widget build(BuildContext context) {
    bool isCollect = widget.itemData["collect"];
    Row rowTop = Row(
      children: <Widget>[
        new Expanded(child: new Row(
          children: <Widget>[
            new Text("作者："),
            new Text(widget.itemData['author'],
              style: new TextStyle(color: Theme.of(context).accentColor),
            )
          ],
        )),
        new Text(widget.itemData['niceDate'])
      ],
    );

    Row rowTitle = new Row(
      children: <Widget>[
        new Expanded(
            child: new Text(widget.itemData['title'],
              softWrap: true,
              //style: new TextStyle(fontSize: 16.0, color: Colors.black),
              textAlign: TextAlign.left,
            )
        )
      ],


    );

    Row rowBottom = Row(
      children: <Widget>[
        new Expanded(child: new Text(widget.itemData['author'],
          style: new TextStyle(color: Theme.of(context).accentColor),
        )),
        new Icon(
            isCollect?Icons.favorite: Icons.favorite_border,
            color: isCollect? Colors.red : null,
        )
      ],
    );

    Column column = new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: rowTop,
        ),

        new Padding(
          padding: EdgeInsets.all(10.0),
          child: rowTitle,
        ),
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: rowBottom,
        ),
      ],

    );
    Card card = new Card(
      elevation: 4.0,
      child: new InkWell(
        child: column,
        onTap: () {
          _itemClick(widget.itemData);

        },
      ),

    );

    return card;
  }

  void _itemClick(itemData) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
       return new ArticleDetailPage(
         title: itemData['title'],
         url: itemData['link'],
       );
    }));

  }
}