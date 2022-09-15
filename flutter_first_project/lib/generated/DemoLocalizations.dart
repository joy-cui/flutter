import 'package:flutter/cupertino.dart';
/**
 * 手写多语言demo
 *
 */

class DemoLocalizations {
  ///该Locale类是用来识别用户的语言环境
  /// 在MyLocalizationsDelegates 的load方法中初始化的
  final Locale locale;

  DemoLocalizations(this.locale);


  ///此处通过静态方式来初始化
  static DemoLocalizations of(BuildContext context) {
    ///Localizations 是多国语言资源的汇总
    return Localizations.of(context, DemoLocalizations);
  }

  //根据不同locale.languageCode 加载不同语言对应
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'task title': 'Flutter Demo',
      'titlebar title': 'Flutter Demo Home Page',
      'click tip': 'You have pushed the button this many times:',
      'inc': 'Increment',
      'click button': 'click select language',
      'welcomes': 'China welcomes you'
    },
    'zh': {
      'task title': 'Flutter 示例',
      'titlebar title': 'Flutter 示例主页面',
      'click tip': '你一共点击了这么多次按钮：',
      'inc': '增加',
      'click button': '点击切换',
      'welcomes': '中国欢迎你'
    },
    'he': {
      'task title': 'Ejemplo de Flutter',
      'titlebar title': 'Flutter 示例主页面',
      'click tip': 'Has hecho clic en los botones tantas veces en total：',
      'inc': '增加',
      'click button': 'Haga clic en cambiar',
      'welcomes': 'Bienvenido a China'
    }
  };

  get taskTitle {
    // Map<String, String> map = _localizedValues!![locale.languageCode];
     var map = _localizedValues[locale.languageCode];
    return map!['task title'];
  }

  get titleBarTitle {
    return _localizedValues[locale.languageCode]!['titlebar title'];
  }

  get clickButtonTitle {
    return _localizedValues[locale.languageCode]!['click button'];
  }

  get clickTop {
    return _localizedValues[locale.languageCode]!['click tip'];
  }

  get inc {
    return _localizedValues[locale.languageCode]!['inc'];
  }
  get welcomes {
    return _localizedValues[locale.languageCode]!['welcomes'];
  }

}