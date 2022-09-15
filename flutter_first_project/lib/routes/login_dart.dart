import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/common/BaseConfigure.dart';
import 'package:github_client_app/common/HttpUtil.dart';
import 'package:github_client_app/common/Global.dart';
import 'package:github_client_app/common/ProfileChangeNotifier.dart';
import 'package:github_client_app/generated/l10n.dart';
import 'package:github_client_app/models/user.dart';
import 'package:github_client_app/network/Api.dart';
import 'package:github_client_app/network/DataHelper.dart';
import 'package:github_client_app/network/ResultData.dart';
import 'package:github_client_app/network/UrlPath.dart';
import 'package:github_client_app/util/LoggerUtil.dart';
import 'package:github_client_app/util/Md5Util.dart';
import 'package:provider/provider.dart';

import '../models/HttpResult.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin ?? "";
    if (_unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(gm.login)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: gm.userName,
                    hintText: gm.userName,
                    prefixIcon: Icon(Icons.person),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v==null||v.trim().isNotEmpty ? null : gm.userNameRequired;
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: gm.password,
                    hintText: gm.password,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                //校验密码（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null : gm.passwordRequired;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    // color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    // textColor: Colors.white,
                    child: Text(gm.login),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 先验证各个表单字段是否合法
    _unameController.text = "cui.li1";
    _pwdController.text = "123456";
    if ((_formKey.currentState as FormState).validate()) {
      User? user;
      var params = DataHelper.getBaseParams();
      params[BaseConfigure.companyIDParam] = BaseConfigure.companyID;
      params["account"] = _unameController.text;
      params["pwd"] = Md5Util.generateMD5(_pwdController.text);
      params["type"] = 1;
      try {
        ResultData response = await Api.getRequest(UrlPath.loginPath, params);
        LoggerUtil.e("tag", response.data);
        HttpResult  httpResult = HttpResult.fromJson(response.data);
        LoggerUtil.e("tag-httpResult", httpResult.isSuccess);
        if(response.isSuccess){
          user = User.fromJson(httpResult.data);
          Provider.of<UserModel>(context, listen: false).user = user;
        }else{
          LoggerUtil.e("tag",httpResult.code);
        }
      }on DioError catch( e){
        LoggerUtil.e("tag", "登录失败===$e.message");
      }
      LoggerUtil.e("登录成功则返回==",(user != null));
      if (user != null) {
        Navigator.of(context).pop();
      }
    }
  }

}