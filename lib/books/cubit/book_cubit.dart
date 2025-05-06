import 'package:bloc/bloc.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../data/model/products_model.dart';
import '../data/repo/book_repo.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());



  ProductsResponseModel? responseModel;
  getBooks()async{
    emit(GetBooksLoading());
    final response=await BookRepo.getAllBooks();
    if(response is DioException){
      emit(GetBooksError(response.response?.data["message"]));
    }else if(response is Response){
      debugPrint("emit succcess data${response.data.toString()}");
      responseModel=ProductsResponseModel.fromJson(response.data);
      debugPrint("emit succcess respnse model${responseModel?.status}");

      emit(GetBooksSuccess(responseModel?.data?.books??[]));
    }else{
      emit(GetBooksError("nou found, please try again!"));
    }
  }
  booksFilter()async{
    emit(GetBooksLoading());

    final response=await BookRepo.booksFilter(max: startValue,min: endValue);
    if(response is DioException){
      emit(GetBooksError(response.response?.data["message"]));
    }else if(response is Response){
      debugPrint("emit succcess data${response.data.toString()}");
      responseModel=ProductsResponseModel.fromJson(response.data);
      debugPrint("emit succcess respnse model${responseModel?.status}");

      emit(GetBooksSuccess(responseModel?.data?.books??[]));
    }else{
      emit(GetBooksError("nou found, please try again!"));
    }
  }


  double startValue=10;
  double endValue=200;
  changeValues(RangeValues value){
    startValue=value.start;
    endValue=value.end;
    emit(ChangeSliderValue());
  }
}