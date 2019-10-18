import 'package:flutter/material.dart';
import 'package:flutter_abc/item/ArticleItem.dart';
import 'package:flutter_abc/widget/SlideView.dart';
import 'package:flutter_abc/http/HttpUtilWithCookie.dart';
import 'package:flutter_abc/http/Api.dart';
import 'dart:async';

class HomePage extends StatefulWidget {

  @override
  _HomeState createState() {
    return new _HomeState();
  }

}

class _HomeState extends State<HomePage> {
  var curPage = 1;
  SlideView _bannerView;
  List listData = new List();

  @override
  void initState() {
    super.initState();
    getBannerRequest();
    getArticleListRequest();
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getBannerRequest();
    getArticleListRequest();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.builder(
        itemCount: listData.length + 1,
        itemBuilder: (context, i) => buildItem(i));

    return new RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
  }

  Widget buildItem(int i) {
    if(i==0) {
      Container container = new Container(
        height: 180.0,
        child: _bannerView,
      );
      return container;
    }
    return ArticleItem(listData[i]);
  }

  void getBannerRequest() {
    HttpUtil.get(Api.BANNER, (data){
      if(data!=null) {
        setState(() {
          _bannerView = new SlideView(data);
        });
      }
    });
  }

  void getArticleListRequest() {
    String url = Api.ARTICLE_LIST+"$curPage/json";
    HttpUtil.get(url, (data){
      if(data!=null) {
        Map<String, dynamic> map = data;
        var _listData = map['datas'];
        setState(() {
          listData.addAll(_listData);
          curPage++;
        });
      }
    });
  }
}
