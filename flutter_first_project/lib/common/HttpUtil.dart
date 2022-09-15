import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'Global.dart';

class Git {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  String tag = "HttpUtil";

  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'http://kf.suirui.com/api/v3',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
    },
  ));

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // client.findProxy = (uri) {
        //   return 'PROXY 192.168.50.154:8888';
        // };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // 登录接口，登录成功后返回用户信息
  // Future<User> login(String login, String pwd) async {
  //   // String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
  //   String pwdMd5 = Md5Util.generateMD5(pwd);
  //   var path = "https://www.wanandroid.com/user/register";
  //   var params = {
  //     "account": login,
  //     "pwd": pwdMd5,
  //   };
  //   LoggerUtil.v( tag,"测试log===开始请求===");
  //   Response response =
  //   await dio.post(path, queryParameters: params);
  //   LoggerUtil.v( tag,"测试log====");
  //   LoggerUtil.v( tag,response);
  //   return User.fromJson(response.data);
  // }

  //获取用户项目列表
//   Future<List<Repo>> getRepos({
//     Map<String, dynamic>? queryParameters, //query参数，用于接收分页信息
//     refresh = false,
//   }) async {
//     if (refresh) {
//       // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
//       _options.extra!.addAll({"refresh": true, "list": true});
//     }
//     var r = await dio.get<List>(
//       "user/repos",
//       queryParameters: queryParameters,
//       options: _options,
//     );
//     return r.data!.map((e) => Repo.fromJson(e)).toList();
//   }
}