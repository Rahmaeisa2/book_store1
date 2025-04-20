import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repo/create_account_repo.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  createAccount({
    required String name,
    required String email,
    required String password,
    required String confirmationPassword
  }) async {
    emit(CreateAccountLoading());
    debugPrint("Create Account Calling");

    final response = await CreateAccountRepo.createAccount(
        name: name,
        email: email,
        password: password,
        confirmationPassword: confirmationPassword);

    if (response is DioException) {
      debugPrint("DioException: ${response.message}");
      emit(CreateAccountError());
    } else if (response["status"] == 201) {
      _saveUserToken(response["data"]["token"]);
      emit(CreateAccountSuccess());
    } else {
      debugPrint("Register error: ${response["message"] ?? response["errors"]}");
      emit(CreateAccountError());
    }}


  void _saveUserToken(String token)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }
}