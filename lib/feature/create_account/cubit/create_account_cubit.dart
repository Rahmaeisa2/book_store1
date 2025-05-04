import 'package:book_store/core/helper/app_function.dart';
import 'package:book_store/core/services/local/shared_pref/shared_pref_key.dart';
import 'package:book_store/feature/create_account/data/model/create_account_request_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/services/local/shared_pref/shared_pref.dart';
import '../data/repo/create_account_repo.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  createAccount({
   required createAccountRequestDate userData
  }) async {
    emit(CreateAccountLoading());
    debugPrint("Create Account Calling");

    final response = await CreateAccountRepo.createAccount(userData: userData
       );

    if (response is DioException) {
      // problem in server or connection
      debugPrint("DioException: ${response.message}");
      emit(CreateAccountError());
    } else if (response["status"] == 201) {
      saveToken(response["data"]["token"]);

      emit(CreateAccountSuccess());
    } else {

      debugPrint("Register error: ${response["message"] ?? response["errors"]}");
      emit(CreateAccountError());
    }}

  void saveToken(String token){
    SharedPref.saveData( value : token, key: prefsKey.tokenKey);
  }

}