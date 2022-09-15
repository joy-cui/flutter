
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:github_client_app/generated/DemoLocalizations.dart';

import 'SelectLanguagePage.dart';

/**
 * 手写多语言实现
 */
GlobalKey<ChangeLocalizationsState> changeLocalizationStateKey = new GlobalKey<ChangeLocalizationsState>();
class MyAppDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///android 应用任务栏显示的标题
//      title: 'Flutter MU KE DEMO',
      home: new Builder(builder: (context) {
        ///通过 Localizations.override 包裹一层。---这里
        ///将 ChangeLocalizations 使用到 MaterialApp 中
        return new ChangeLocalizations(
          key: changeLocalizationStateKey,
          child: new SelectLanguagePage( title: 'Flutter MU KE DEMO',),
        );
      }),
      /// 此处 配制多语言环境
      ///配置 android 应用任务栏显示的标题 的国际化
      ///因为 DemoLocalizations 使用到了context 所以这里不使用title 属性
      onGenerateTitle: (context) {
        ///根据语言环境来获取 taskTitle
        ///DemoLocalizations 为自定义的语言文字适配中心
        return DemoLocalizations.of(context).taskTitle;
      },
      ///本地化委托，用于更改Flutter Widget默认的提示语，按钮text等
      ///通常我们新建的 Flutter 应用是默认不支持多语言的，即使用户在中文环境下，显示的文字仍然是英文
      localizationsDelegates: [
        ///初始化默认的 Material 组件本地化
        GlobalMaterialLocalizations.delegate,
        ///初始化默认的 通用 Widget 组件本地化
        GlobalWidgetsLocalizations.delegate,
        ///初始化自定义多语言环境运行
        MyLocalizationsDelegates.delegate,
      ],

      ///当前区域，如果为null则使用系统区域一般用于语言切换
      ///传入两个参数，语言代码，国家代码
      ///这里配制为中国
      locale: Locale('zh', 'CN'),

      ///传入支持的语种数组
      supportedLocales: [
        const Locale('en', 'US'), // English 英文
        const Locale('he', 'IL'), // Hebrew 西班牙
        const Locale('zh', 'CN'), // 中文，后面的countryCode暂时不指定
      ],

      ///当传入的是不支持的语种，可以根据这个回调，返回相近,并且支持的语种
      localeResolutionCallback: (local, support) {
        ///当前软件支行的语言 也就是[supportedLocales] 中配制的语种
        if (support.contains(local)) {
          print('support  $local');
          return local;
        }
        ///如果当前软件运行的手机环境不在 [supportedLocales] 中配制的语种范围内
        ///返回一种默认的语言环境，这里使用的是中文
        print('no_support local is $local and support is $support');
        return const Locale('zh', 'CN');
      },
    );
  }

}

class ChangeLocalizations extends StatefulWidget {
  final Widget child;

  ChangeLocalizations({required Key key, required this.child}) : super(key: key);

  @override
  ChangeLocalizationsState createState() => ChangeLocalizationsState();
}

class ChangeLocalizationsState extends State<ChangeLocalizations> {
  //初始是中文
  Locale _locale = const Locale('zh', 'CH');

  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  //通过Localizations.override 包裹我们需要构建的页面
  @override
  Widget build(BuildContext context) {
    //通过Localizations 实现实时多语言切换
    //通过 Localizations.override 包裹一层。---这里
    return new Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}

class MyLocalizationsDelegates
    extends LocalizationsDelegate<DemoLocalizations> {
  ///构造
  const MyLocalizationsDelegates();
  ///静态构造
  static MyLocalizationsDelegates delegate = const MyLocalizationsDelegates();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh', 'he'].contains(locale.languageCode);
  }

  @override //是否需要重载
  bool shouldReload(LocalizationsDelegate old) => false;

  ///MyLocalizations就是在此方法内被初始化的
  ///通过方法的 locale 参数，判断需要加载的语言，然后返回自定义好多语言实现类MyLocalizations
  ///最后通过静态 delegate 对外提供 LocalizationsDelegate。
  @override
  Future<DemoLocalizations> load(Locale locale) {
    //加载本地化
    return new SynchronousFuture(new DemoLocalizations(locale));
  }
}