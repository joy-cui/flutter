import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/generated/DemoLocalizations.dart';

import 'demoWidget.dart';

/**
 * 多语言切换
 */
class SelectLanguagePage extends StatefulWidget {
  SelectLanguagePage({Key ?key,  required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SelectLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        ///多种语言支持的导航栏标题
        title: Text(DemoLocalizations
            .of(context)
            .titleBarTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ///多种语言支持的显示文本
            Text(DemoLocalizations
                .of(context)
                .welcomes, style: TextStyle(color: Colors.red, fontSize: 22),),
            Padding(
              padding: EdgeInsets.all(30),
            ),

            ///点击按钮显示语言选择框
            FlatButton(
              child: Text(DemoLocalizations
                  .of(context)
                  .clickButtonTitle),
              onPressed: () {
                changeLocale();
              },
            )
          ],
        ),
      ),
    );
  }


  ///语言切换
  ///这里则是弹框内容了
  void changeLocale() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
    {
      return new SimpleDialog(
        title: new Text("请选择语言"),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              switchLanguage(0);
              Navigator.of(context).pop();
            },
            child: const Text("中文"),
          ),
          SimpleDialogOption(
            onPressed: () {
              switchLanguage(1);
              Navigator.of(context).pop();
            },
            child: const Text("英语"),
          ),
          SimpleDialogOption(
            onPressed: () {
              switchLanguage(2);
              Navigator.of(context).pop();
            },
            child: const Text("西班牙语"),
          )
        ],
      );
    },);
  }

  ///切换语言
  ///通过 changeLocalizationStateKey 来修改本应用内的 Locale
  void switchLanguage(int index) {
    switch (index) {
      case 0:
        changeLocalizationStateKey.currentState!.changeLocale(
            const Locale('zh', 'CH'));
        break;
      case 1:
        changeLocalizationStateKey.currentState!.changeLocale(
            const Locale('en', 'US'));
        break;
      case 2:
        changeLocalizationStateKey.currentState!.changeLocale(
            const Locale('he', 'IL'));
        break;
    }
  }
}