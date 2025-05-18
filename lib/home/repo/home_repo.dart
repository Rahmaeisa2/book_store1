
import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/network/dio_helper/end_point.dart';
import '../../feature/books/data/model/products_model.dart';

class HomeRepo{



  static Future<ProductsResponseModel?> getNewArrivalsList()async{
    try{
      final response=await dioHelper.getData(endPoint: endPoint.newArrivals);
      if(response?.statusCode==200){
        return ProductsResponseModel.fromJson(response?.data);
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }

  static Future<ProductsResponseModel?> getBestSellerList()async{
    try{
      final response=await dioHelper.getData(endPoint: endPoint.bestSeller);
      if(response?.statusCode==200){
        return ProductsResponseModel.fromJson(response?.data);
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }
}