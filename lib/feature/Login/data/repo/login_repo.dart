import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/network/dio_helper/end_point.dart';

class LoginRepo{

  Future login({required String email,required String pass})async{
    try{
      final response=await dioHelper.postData(endPoint: endPoint.login,
          data: {
            "email" : email,
            "password" : pass
          }
      );
      return response;

    }catch(e){
      return e;
    }
  }

}