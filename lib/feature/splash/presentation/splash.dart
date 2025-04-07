import 'package:book_store/feature/Login/login.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/custom_button.dart';
import '../../register/persentation/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.jpeg'),
              opacity: 100,
              fit: BoxFit.cover,
            ),
          ),
         child: Container(
           color: Colors.black.withOpacity(.3),
             child:Center(
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

                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                       },
                     ),
                     SizedBox(height: 15,),
                     CustomButton(
                       name: "Register",
                       background: Colors.white,
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder:(context)=>RegisterScreen() ));
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
