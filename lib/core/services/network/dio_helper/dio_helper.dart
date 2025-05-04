import 'package:book_store/core/services/network/dio_helper/end_point.dart';
import 'package:dio/dio.dart';

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
  }
 static postData({
    required String endPoint,
    Map<String,dynamic>? data,
    Map<String,dynamic>? query

  }){
    return _dio?.post(endPoint ,data: data, queryParameters: query);
  }
}