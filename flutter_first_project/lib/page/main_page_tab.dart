import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/generated/l10n.dart';
import 'package:github_client_app/util/ColorUtil.dart';
import 'package:github_client_app/widgets/CustomTabIndicator.dart';

class MainPageTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TabBarView();
  }
}

class _TabBarView extends StatelessWidget {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    Color styleColor = Theme.of(context).primaryColor;
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) {
          tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              print('${tabController.index}');
            }
          });

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: TabBar(
              padding: EdgeInsets.only(left: 20),
              labelColor: styleColor,
              unselectedLabelColor: Colors.black26,
              isScrollable: true,
              tabs: [
                Tab(text: S.of(context).meetingMinutes,),
                Tab(text: S.of(context).meetingSchedule,)
              ],
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const CustomTabIndicator(
                  width: 30,
                  borderSide: BorderSide(width: 3.0, color: Colors.blue)),
            ),
            body: TabBarView(children: [
              Icon(Icons.supervised_user_circle_rounded),
              Icon(Icons.add_alert_rounded)
            ]),
          );
        },
      ),
    );
  }
}
