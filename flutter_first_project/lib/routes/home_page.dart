import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/common/ProfileChangeNotifier.dart';
import 'package:github_client_app/generated/l10n.dart';
import 'package:github_client_app/models/HttpResult.dart';
import 'package:github_client_app/models/conferencelist.dart';
import 'package:github_client_app/network/Api.dart';
import 'package:github_client_app/network/DataHelper.dart';
import 'package:github_client_app/network/ResultData.dart';
import 'package:github_client_app/network/UrlPath.dart';
import 'package:github_client_app/page/main_page.dart';
import 'package:github_client_app/util/LoggerUtil.dart';
import 'package:github_client_app/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute>
    with SingleTickerProviderStateMixin {
  static const loadingTag = "##loading##"; //表尾标记
  // var _items = <Repo>[Repo()..name = loadingTag];
  bool hasMore = true; //是否还有数据
  int page = 1; //当前请求的是第几页

  // 当前页面索引
  int _currentPage = 0;

  //页面控制器
  late TabController _tabController;

  // body界面
  final List<Widget> _pages = [MainPage(), MainPage(), MainPage()];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = new TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() {
      print("initState===${_tabController.previousIndex}");
      setState(() {
        _currentPage = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildHome();
  }

  Widget _buildHome() {
    return new Scaffold(
      appBar:_currentPage == 0 ? null :  _buildAppBar(),
      drawer: _currentPage == 2 ? MyDrawer() : null, //抽屉菜单
      body: _buildBody(), // 构建主页面
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.black26,
          tabs: <Widget>[
            new Tab(
              text: S.of(context).homePage,
              icon: new Icon(Icons.water_damage_rounded),
            ),
            new Tab(
              text: S.of(context).mailList,
              icon: new Icon(Icons.wc_outlined),
            ),
            new Tab(
              text: S.of(context).me,
              icon: new Icon(Icons.archive_sharp),
            ),
          ],
          onTap: (int i) {
            setState(() {
              _currentPage = i;
            });
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    switch (_currentPage) {
      case 0:
        return AppBar(
          title: Text(S.of(context).homePage),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        );
      case 1:
        return AppBar(
          centerTitle: true,
          title: Text(S.of(context).mailList),
        );
      default:
        return AppBar(
          centerTitle: true,
          title: Text(S.of(context).me),
        );
    }
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      //用户未登录，显示登录按钮
      return Center(
        child: ElevatedButton(
          child: Text(S.of(context).login),
          onPressed: () => Navigator.of(context).pushNamed("login"),
        ),
      );
    } else {
      // Future<Conferencelist?> conferenceList = onGetConferenceList();
      // conferenceList.then((value) => listViewListTile(value));
      // return ListView(
      //   children: <Widget>[
      //     ListTile(
      //       leading: const Icon(Icons.color_lens),
      //       title: Text("gm.theme"),
      //       onTap: () => Navigator.pushNamed(context, "themes"),
      //     ),
      //   ],
      // );
      return HomePageWidget();
    }
  }

  Widget HomePageWidget() {
    return new TabBarView(
      controller: _tabController,
      children: _pages,
    );
  }

  // void _retrieveData() async {
  //   var data = await Git(context).getRepos(
  //     queryParameters: {
  //       'page': page,
  //       'page_size': 20,
  //     },
  //   );
  //   //如果返回的数据小于指定的条数，则表示没有更多数据，反之则否
  //   hasMore = data.length > 0 && data.length % 20 == 0;
  //   //把请求到的新数据添加到items中
  //   setState(() {
  //     _items.insertAll(_items.length - 1, data);
  //     page++;
  //   });
  // }

  Widget listViewListTile(Conferencelist? conferencelist) {
    List list = conferencelist!.list;
    List<Widget> _list = [];
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        _list.add(new Center(
          child: ListTile(
            leading: new Icon(Icons.list),
            title: new Text(list[i].confName),
            trailing: new Icon(Icons.keyboard_arrow_right),
          ),
        ));
      }
    }
    return new ListView(
      children: _list,
    );
  }

  Future<Conferencelist?> onGetConferenceList() async {
    Conferencelist? conferencelist;
    UserModel userModel = Provider.of<UserModel>(context);
    // 先验证各个表单字段是否合法
    if (userModel.isLogin) {
      var params = DataHelper.getBaseParams();
      params["token"] = userModel.user?.token;
      params["currentPage"] = 0;
      params["pageSize"] = 10;
      // params["scope"] = "0";
      try {
        ResultData response =
            await Api.postRequest(UrlPath.conferenceListPath, params);
        LoggerUtil.e("tag", response.data);
        HttpResult httpResult = HttpResult.fromJson(response.data);
        if (response.isSuccess && response.data != null) {
          conferencelist = Conferencelist.fromJson(response.data);
        } else {
          LoggerUtil.e("获取列表失败", httpResult.code);
        }
      } on DioError catch (e) {
        LoggerUtil.e("tag", "获取列表失败===$e.message");
      }
    }
    return conferencelist;
  }
}
