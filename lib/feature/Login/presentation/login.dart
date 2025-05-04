
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/custom__text_form_filed.dart';
import '../../../core/widget/custom_button.dart';

import '../cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Login" ,
        style: TextStyle(
          fontSize: 25,
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Center(child: CircularProgressIndicator()),
                    ));
              } else if (state is LoginSuccess) {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, "/bottomNav", (route) => false,);
              } else if (state is LoginError) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(state.errorMessage),
                    ));
              }
            },
            child: Column(
              children: [
                CustomTextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value?.trim() == null || value!.trim().isEmpty) {
                      return "email is required";
                    }
                  },
                  title: "Email",
                  hintText: "example@gmail.com",
                ),
                CustomTextFormField(
                  controller: passController,
                  validator: (value) {
                    if (value?.trim() == null || value!.trim().isEmpty) {
                      return "password is required";
                    } else if (value.length < 8) {
                      return "password must be 8 char";
                    }
                  },
                  title: "Password",
                  hintText: "**********",
                ),
                CustomButton(
                    onTap: () {
                      context.read<LoginCubit>().login(
                          email: emailController.text,
                          pass: passController.text);
                    },
                    name: "Login")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

