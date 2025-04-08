import 'package:book_store/core/widget/custom__text_form_filed.dart';
import 'package:book_store/core/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
   ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_outlined ,)),
        title:Text(
          "Forget Password" , style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        vertical: 40),
        child: Center(
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                "Enter your email \n"
                  "to reset your password",
               style: TextStyle(
                 fontSize: 19,
                 fontWeight: FontWeight.w600
               ),),
              SizedBox(
                height: 13,
              ),
              CustomTextFormField(title: "Email" ,
                hintText: "example@gmail.com",
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(name: "Log in ", onTap: (){}),


            ],
          ),
        ),
      ),
    );
  }
}
