import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/models/profile.dart';
import 'package:github_client_app/models/user.dart';

import 'Global.dart';

class ProfileChangeNotifier extends ChangeNotifier{

  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();  //保存profile变更
    super.notifyListeners();  ////通知依赖的Widget更新
  }
}

//用户状态
class UserModel extends ProfileChangeNotifier {
  User? get user => _profile.user;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;

  set user(User? user){
    if(user?.account != _profile.user?.account){
      _profile.lastLogin = _profile.user?.account;
      _profile.user = user;
      notifyListeners();
    }
  }
}

//App主题状态
class ThemeModel extends ProfileChangeNotifier{
  //默认使用蓝色主题
  MaterialColor get theme => Global.themes.
  firstWhere((e) => e.value == _profile.theme, orElse: () => Colors.blue);

  //主题改变后，通知其依赖项，新主题立即生效
  set theme(ColorSwatch color){
    if(color != theme){
      _profile.theme = color[500]!.value;
      notifyListeners();
    }
  }

}

//国际化
class LocaleModel extends ProfileChangeNotifier{

  //获取当前用户的App语言配置Local类，如果为null，则语言跟随系统语言
  Locale? getLocale(){
    if(_profile.locale == null) return null;
    var t = _profile.locale!.split("_");
    return Locale(t[0], t[1]);
  }

  String? get locale => _profile.locale;

  // ignore: non_constant_identifier_names
  set locale(String? locale){
    if(locale != _profile.locale){
      _profile.locale = locale;
      notifyListeners();
    }
  }
}