import 'package:book_store/feature/Login/cubit/login_cubit.dart';
import 'package:book_store/feature/Login/presentation/login.dart';
import 'package:book_store/feature/create_account/cubit/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widget/custom_button.dart';
import '../../create_account/persentation/create_account_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.jpeg'),
            opacity: 100,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            color: Colors.black.withOpacity(.3),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 13
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Frame 11.png"),
                    SizedBox(height: 45),
                    CustomButton(
                      name: "Login",

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => LoginCubit(),
                              child: LoginScreen(),
                            ),
                          ),

                        );
                      },
                    ),
                    SizedBox(height: 15,),
                    CustomButton(
                      name: "Register",
                      background: Colors.white,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (
                                context) =>
                                BlocProvider(
                                  create: (context) => CreateAccountCubit(),
                                  child: CreateAccount(),
                                )));
                      },
                    ),
                  ],
                ),
              ),
            )
        ),
      ),

    );
  }
}