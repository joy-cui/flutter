import 'dart:collection';

import 'package:github_client_app/common/BaseConfigure.dart';

class DataHelper{
  static  Map<String,dynamic> getBaseParams() {
    Map<String,dynamic> params = new SplayTreeMap<String, dynamic>();
    params[BaseConfigure.appIdparam] = BaseConfigure.appId;
    params[BaseConfigure.secretKeyParam] = BaseConfigure.secretKey;
    return params;
  }
}