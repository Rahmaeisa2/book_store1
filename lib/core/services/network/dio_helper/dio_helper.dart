import 'package:book_store/core/services/network/dio_helper/end_point.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class dioHelper{
  static Dio? _dio;
  static init(){
    _dio = Dio(BaseOptions(
      baseUrl: endPoint.baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },));
    _dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    )
    );
  }

 static postData({
    required String endPoint,
    Map<String,dynamic>? data,
    Map<String,dynamic>? query

  }){
    return _dio?.post(endPoint ,data: data, queryParameters: query);
  }
  static Future<Response?> getData({
    required String endPoint,
    Map<String,dynamic>? data,
    Map<String,dynamic>? query,

  })async{
    return await _dio?.get(endPoint,data: data,queryParameters: query);
  }
}