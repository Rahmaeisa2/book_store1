
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/books/data/model/products_model.dart';
import '../repo/home_repo.dart';
part 'home_state.dart';


class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitialState());



  getNewArrivalsList()async{
    emit(NewArrivalsLoading());

    final response=await HomeRepo.getNewArrivalsList();

    if(response is DioException){
      emit(NewArrivalsError());
    }else if(response is ProductsResponseModel){
      emit(NewArrivalsSuccess(response.data?.books??[]));
    }else{
      emit(NewArrivalsError());

    }
  }

  getBestSellerList()async{
    emit(BestSellerLoading());

    final response=await HomeRepo.getBestSellerList();

    if(response is DioException){
      emit(BestSellerError());
    }else if(response is ProductsResponseModel){
      emit(BestSellerSuccess(response.data?.books??[]));
    }else{
      emit(BestSellerError());

    }
  }


}