import 'package:book_store/book_store.dart';
import 'package:book_store/core/services/local/shared_pref/shared_pref.dart';
import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPref.init();
 dioHelper.init();
  runApp(const BookStore());
}

