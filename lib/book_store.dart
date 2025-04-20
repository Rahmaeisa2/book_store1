import 'package:book_store/feature/onboarding/presentation/onboarding_screen.dart';
import 'package:book_store/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookStore extends StatefulWidget {
  const BookStore({super.key});

  @override
  State<BookStore> createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  late final SharedPreferences? prefs;
  @override
  void initState() {
    fatchToken();

    // TODO: implement initState
    super.initState();
  }
  fatchToken()async{
    prefs = await SharedPreferences.getInstance();

  }
  @override
  Widget build(BuildContext context) {
    print("get token");
    debugPrint(getToken().toString());
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:getToken()!=null ?TestScreen(): OnBoardingScreen(),
      ),
    );
  }

  String? getToken(){
    return prefs?.getString("token");


  }
}
