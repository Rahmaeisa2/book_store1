import 'package:book_store/core/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/widget/custom__text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_outlined,
          size: 20,
        ),
        ),
        title: Text("LOGIN",
        style: TextStyle(
          fontSize: 21,
          fontWeight:FontWeight.bold
        ),),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 50
          ),
          child: SingleChildScrollView(
            child: Column(
                children: [
                  CustomTextFormField(
                    title: "Email",
                    hintText: "Example@gmail.com",
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  CustomTextFormField(title: "Password",
                  hintText: "**********",
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Checkbox(value: value, onChanged: (bool? newValue){
                            setState(() {
                              value=newValue;
                            });
                          }),
                        ),
                        Text("Remember me", style: TextStyle(
                          fontSize: 16 ,
                        ),),
                        Spacer(),
                        TextButton(onPressed: (){}, child: Text(
                          "Forget your password?"
                              ,style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16
                        ),
                        )),
                      ],
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButton(name: "Log in ", onTap: (){}),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                      TextButton(onPressed: (){}, child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.pink
                        ),
                      ))
                    ],
                  )
                ],
              ),
          ),
        ),
      ),

    );
  }
}
