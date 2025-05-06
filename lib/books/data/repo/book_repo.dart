import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/network/dio_helper/end_point.dart';
import 'package:flutter/cupertino.dart';

class BookRepo{



  static Future getAllBooks()async{
    try{
      final response=await dioHelper.getData(endPoint: endPoint.books);
      debugPrint("try ${response.toString()}");
      if(response?.statusCode==200){
        return response;
      }else{
        return null;
      }

    }catch(e){
      debugPrint("catch ${e.toString()}");

      return null;
    }
  }
  static Future booksFilter({double? min, double?max})async{
    try{
      final response=await dioHelper.getData(endPoint: endPoint.booksFilter,
          query: {
            "max":min?.toStringAsFixed(2),
            "min":max?.toStringAsFixed(2)
          }
      );

      debugPrint("try ${response.toString()}");
      if(response?.statusCode==200){
        return response;
      }else{
        return null;
      }

    }catch(e){
      debugPrint("catch ${e.toString()}");

      return null;
    }
  }
}