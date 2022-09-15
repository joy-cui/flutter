import 'package:dio/dio.dart';
import 'package:github_client_app/util/LoggerUtil.dart';
import 'ResultData.dart';

/// 数据初步处理
class ResponseInterceptors extends InterceptorsWrapper {
  String tag = "ResponseInterceptors";
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions option = response.requestOptions;

    try {
      if (option.contentType != null && option.contentType!.contains("text")) {
        response.data = ResultData(response.data, true, 200);
        handler.next(response);
      }

      ///一般只需要处理200的情况，300、400、500保留错误信息，外层为http协议定义的响应码
      if (response.statusCode == 200 || response.statusCode == 201) {
        ///内层需要根据公司实际返回结构解析，一般会有code，data，msg字段

         String code = response.data["code"];
        if (code == "200") {
          response.data = ResultData(response.data, true, 200);
          handler.next(response);
        } else {
          response.data = ResultData(response.data, false, 200);
          handler.next(response);
        }
      }else{
        response.data = ResultData(response.data, false, response.statusCode);
        handler.next(response);
      }
    } catch (e) {
      LoggerUtil.v(tag,"ResponseError====" + e.toString() + "**** " + option.path);

      response.data = ResultData(response.data, false, response.statusCode);
      handler.next(response);
    }
  }
}
