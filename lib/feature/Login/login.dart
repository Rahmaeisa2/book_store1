import 'package:book_store/core/widget/custom_button.dart';
import 'package:book_store/feature/ForgetPassword/presentation/forget_password.dart';
import 'package:book_store/feature/register/persentation/register_screen.dart';
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
  final bool _passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  final formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
            fontSize: 20,
            fontWeight:FontWeight.bold
          ),),
        ),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20
            ),
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      title: "Email",
                      hintText: "Example@gmail.com",
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    CustomTextFormField(
                      controller: passwordController,

                      title: "Password",
                    hintText: "**********",
                      prefixIcon: Icon(Icons.lock),
                      isPassword: true,

                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Checkbox(
                              activeColor: Colors.pink,
                                value: value, onChanged: (bool? newValue){
                              setState(() {
                                value=newValue;
                              });
                            }),
                          ),
                          Text("Remember me", style: TextStyle(
                            fontSize: 16 ,
                          ),),
                          Spacer(),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));

                          }, child: Text(
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
                    CustomButton(name: "Log in ", onTap: (){
                      if(formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data'))
                            );

                      }
                      else{
                        print("requierd");
                      }
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                        }, child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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

      ),
    );
  }
}
