import 'package:dio/dio.dart';

import 'Code.dart';
import 'DioLogInterceptor.dart';
import 'Loading.dart';
import 'ResponseInterceptor.dart';
import 'ResultData.dart';
import 'UrlPath.dart';

class HttpManager {
  static HttpManager _instance = HttpManager._internal();
  factory HttpManager() => _instance;
  late Dio _dio;

  static const CODE_SUCCESS = 200;
  static const CODE_TIME_OUT = -1;
  static const CONNECT_TIMEOUT = 15000;

  ///通用全局单例，第一次使用时初始化
 HttpManager._internal({ String? baseUrl}) {
      _dio = new Dio(new BaseOptions(
          baseUrl: UrlPath.baseUrl, connectTimeout: CONNECT_TIMEOUT));
      _dio.interceptors.add(new DioLogInterceptor());
      _dio.interceptors.add(new ResponseInterceptors());
  }

  static HttpManager getInstance({ String? baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名
  HttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  HttpManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != UrlPath.baseUrl) {
        _dio.options.baseUrl = UrlPath.baseUrl;
      }
    }
    return this;
  }

  ///通用的GET请求
  get(api, {params, withLoading = true}) async {
    if (withLoading) {
      Loading.show();
    }

    Response response;
    try {
      response = await _dio.get(api, queryParameters: params);
      if (withLoading) {
        Loading.dismiss();
      }
    } on DioError catch (e) {
      if (withLoading) {
        Loading.dismiss();
      }
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }
    return response.data;
  }

  ///通用的POST请求
  post(api, {params, withLoading = true}) async {
    if (withLoading) {
      Loading.show();
    }
    Response response;
    try {
      response = await _dio.post(api, data: params);
      if (withLoading) {
        Loading.dismiss();
      }
    } on DioError catch (e) {
      if (withLoading) {
        Loading.dismiss();
      }
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    return response.data;
  }
}

ResultData resultError(DioError e) {
  try{
      Response errorResponse ;
      errorResponse = e.response!;
    if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.receiveTimeout) {
      errorResponse.statusCode = Code.NETWORK_TIMEOUT;
    }
    return new ResultData(
        errorResponse.statusMessage, false, errorResponse.statusCode);
  }catch(e){
    return new ResultData(
       "网络请求异常了", false, Code.NETWORK_EXCEPTION);
  }
}