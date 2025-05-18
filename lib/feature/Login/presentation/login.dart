import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widget/custom__text_form_filed.dart';
import '../../../core/widget/custom_button.dart';
import '../../bottom_nav_bar/bottom_nav_bar.dart';
import '../cubit/login_cubit.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();


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
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0,
        vertical: 26),
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
            child: Form(
              key: formKey,
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
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                    isPassword: true,
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
                  SizedBox(
                    height: 12,
                  ),
                  CustomButton(onTap: (){
    if (formKey.currentState!.validate()) {
    context.read<LoginCubit>().login(
    email: emailController.text,
    pass: passController.text,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBarScreen()));
    }
                      },
                      name: "Login")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

