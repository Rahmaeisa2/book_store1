import 'package:book_store/core/services/local/shared_pref/shared_pref.dart';
import 'package:book_store/core/services/local/shared_pref/shared_pref_key.dart';
import 'package:book_store/core/widget/custom_button.dart';
import 'package:book_store/feature/splash/presentation/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(
          height: 300,
        ),
        CustomButton(name: "Logout", onTap: (){
          SharedPref.removeData(prefsKey.tokenKey);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>SplashScreen()));
        })
      ],
    );
  }
}
