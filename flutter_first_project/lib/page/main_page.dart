import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/generated/l10n.dart';
import 'package:github_client_app/page/main_page_tab.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pageDatas = [];
  late TabController controller;
  late var _height ;

  @override
  void initState() {
    pageDatas.add({
      "title": "一年级英语",
      "content": ["我是一年级英语一班", "我是一年级英语二班", "我是一年级英语三班"]
    });
    pageDatas.add({
      "title": "二年级英语",
      "content": ["我是二年级英语一班", "我是二年级英语二班", "我是二年级英语三班"]
    });
    controller =
        TabController(length: pageDatas.length, vsync: ScrollableState());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    _height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          height: 150,
          color: color,
        ),
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, top: 35),
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(S.of(context).huijian,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      Container(
                        // margin: EdgeInsets.only(right: 20),
                        // color: Colors.blue,
                        child: IconButton(
                          icon: Icon(Icons.search_rounded),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                _mainWidget(context),
                _mainBodyWidget(),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _mainWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20),
      // color: Colors.white,
      height: 100,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        border: new Border.all(width: 1, color: Colors.white),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
              Text(
                S.of(context).joinMeeting,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.archive)),
              Text(
                S.of(context).startMeeting,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.assignment_turned_in_outlined)),
              Text(
                S.of(context).orderMeeting,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _mainBodyWidget() {
    print(_height);
    return Container(
      // height: MediaQuery.of(context).size.height,
      height:500,
      child: MainPageTabBar(),
    );
  }
}
