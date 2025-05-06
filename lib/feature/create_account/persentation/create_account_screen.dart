import 'package:book_store/core/helper/extention.dart';
import 'package:book_store/core/widget/custom__text_form_filed.dart';
import 'package:book_store/core/widget/custom_button.dart';
import 'package:book_store/feature/Login/presentation/login.dart';
import 'package:book_store/feature/create_account/cubit/create_account_cubit.dart';
import 'package:book_store/feature/create_account/data/model/create_account_request_data.dart';
import 'package:book_store/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();

}

class _CreateAccountState extends State<CreateAccount> {
  bool? value = false;
  bool? isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

@override
  void dispose() {
nameController.dispose();
emailController.dispose();
passwordController.dispose();
confirmPasswordController.dispose();

super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_outlined,
              size: 20,
            ),
          ),
          title: Text(
            "Register",
            style: TextStyle(
                fontSize: 23
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 20
            ),
            child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
              listener: (context, state) {
                debugPrint("State of create account ${state.toString()}");
                if(state is CreateAccountSuccess){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }else if(state is CreateAccountError){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error')),);

                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    CustomTextFormField(
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "name is required";
                        }
                      },

                      controller: nameController,
                      hintText: 'Rahma Eisa',
                      title: "Name",
                    ),
                    SizedBox(height: 15,),

                    CustomTextFormField(
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "email is required";
                        }else if(!emailController.text.toString().isValidEmail){
                          return "please enter a valid email";
                        }
                        else if(context.read<CreateAccountCubit>().errorMessage!=null){
                          return context.read<CreateAccountCubit>().errorMessage;
                        }
                      },
                      controller: emailController,
                      title: "Email",
                      hintText: "example@gamil.com",
                      prefixIcon: Icon(Icons.email),),
                    SizedBox(height: 15,),
                    CustomTextFormField(
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "password is required";
                        }else if(value.length<8){
                          return "password must be 8 char";
                        }
                      },
                      title: "Password",
                      prefixIcon: Icon(Icons.lock),
                      hintText: "********",
                      controller: passwordController,
                      isPassword: true,),
                    SizedBox(height: 15,),

                    CustomTextFormField(
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "confirmation password is required";
                        }else if(confirmPasswordController.text!=passwordController.text){
                          return "confirmation password must be same as password";
                        }
                      },
                      controller: confirmPasswordController,
                      title: "Confirm password",
                      hintText: "*********",
                      prefixIcon: Icon(Icons.lock),
                      isPassword: true,

                    ),

                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.pink,
                            value: value, onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue;
                          });
                        }),
                        Text("Agree with"
                          , style: TextStyle(fontSize: 17),),
                        TextButton(
                            onPressed: () {}, child: Text("Terms & Conditions",
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 17
                          ),))

                      ],
                    ),
                    SizedBox(height: 12,),
                    if(state is CreateAccountLoading)
                      LinearProgressIndicator(),
                    CustomButton(name: "Create account", onTap: () {
                      context.read<CreateAccountCubit>().createAccount(
                        userData: createAccountRequestDate(name: nameController.text, email: emailController.text, password: passwordController.text, confirmPassword: confirmPasswordController.text)
                        );

                      if (formKey.currentState!.validate()) {
                        if (formKey.currentState?.validate() ?? false) {
                          // Check if password and confirm password match
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Passwords do not match')),
                            );
                          }
                        }
                      } else {
                        if (!value!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Please agree to the terms')),
                          );
                        }
                      }
                    }),
                    SizedBox(height: 12,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                          style: TextStyle(
                              fontSize: 20,
                          ),),
                        TextButton(onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>

                            LoginScreen(),
                              ));
                        }, child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.pink
                          ),
                        ))
                      ],
                    )

                  ],
                );
              },
            ),
          ),
        ),

      ),
    );
  }
}

