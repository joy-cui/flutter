import 'HttpManager.dart';
import 'UrlPath.dart';

/// 所有接口类
class Api {
  static getRequest(String requestPath,Map<String, dynamic> param) {
    return HttpManager.getInstance().get(requestPath, params: param,withLoading: false);
  }

  static postRequest(String requestPath,Map<String, dynamic> param,) {
    return HttpManager.getInstance().post(requestPath, params: param,withLoading: false);
  }



}
