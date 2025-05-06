import 'package:book_store/core/services/local/shared_pref/shared_pref.dart';
import 'package:book_store/core/services/local/shared_pref/shared_pref_key.dart';
import 'package:book_store/feature/onboarding/presentation/onboarding_screen.dart';
import 'package:book_store/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/splash/presentation/splash.dart';

class BookStore extends StatefulWidget {
  const BookStore({super.key});

  @override
  State<BookStore> createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  @override

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
        home:StartScreen(),
      ),
    );
  }

  Future<String?> getToken()async {

    return SharedPref.getData(prefsKey.tokenKey);
  }
  Widget StartScreen(){
    if(getToken()==null){
      return HomeScreen();
    }else if (SharedPref.getData(prefsKey.onBoardingIsOpen)==null){
      return SplashScreen();
    }else{
      return OnBoardingScreen();
    }
  }
}
