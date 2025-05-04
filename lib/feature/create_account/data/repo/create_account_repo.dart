import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/network/dio_helper/end_point.dart';
import 'package:book_store/feature/create_account/data/model/create_account_request_data.dart';
import 'package:dio/dio.dart';


class CreateAccountRepo {

  static  createAccount(
      {required createAccountRequestDate userData}) async {
    try {
      final response = await dioHelper?.postData(
          endPoint: endPoint.createAccount, data: {
        "name": userData.name,
        "email": userData.email,
        "password": userData.password,
        "password_confirmation": userData.confirmPassword
      });
      if(response?.statusCode==201){
        return response?.data;
      }else{
        return null;
      }

    }catch(e) {
      if (e is DioException) {
        return e.response?.data ?? {'error': 'Something went wrong'};
      }
      return {'error': 'Unexpected error'};
    }
  }
  }