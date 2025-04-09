import 'package:book_store/core/widget/custom__text_form_filed.dart';
import 'package:book_store/core/widget/custom_button.dart';
import 'package:book_store/feature/Login/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? value = false;
  bool? isChecked=false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
            child: Column(
              children: [
                CustomTextFormField(
                  controller: nameController,
                  hintText: 'Rahma Eisa',
                  title: "Name" ,
                ),
                SizedBox(height: 15,),

                CustomTextFormField(
                  controller: emailController,
                  title: "Email" ,
                 hintText: "example@gamil.com",
                prefixIcon: Icon(Icons.email),),
                SizedBox(height: 15,),
                CustomTextFormField(title: "Password" ,
                prefixIcon: Icon(Icons.lock),
                hintText: "********",
                controller: passwordController,
                isPassword: true,),
                SizedBox(height: 15,),

                CustomTextFormField(
                  controller: confirmPasswordController,
                  title: "Confirm password" , hintText: "*********",
                prefixIcon: Icon(Icons.lock),
                isPassword: true,

                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                   Checkbox(
                     activeColor: Colors.pink,
                       value: value, onChanged: (bool? newValue){
                      setState(() {
                        value=newValue;
                      });
                    }),
                        Text("Agree with"
                        ,style: TextStyle(fontSize: 17),),
                        TextButton(onPressed: (){}, child: Text("Terms & Conditions",
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 17
                        ),))

                  ],
                ),
                SizedBox(height: 12,),
                CustomButton(name: "Create account", onTap: (){
                  if(formKey.currentState!.validate()){
                    if (formKey.currentState?.validate() ?? false) {
                      // Check if password and confirm password match
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Passwords do not match')),
                        );
                      }
                    }
                  }else{
    if (!value!) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Please agree to the terms')),
    );
                  }
                }}),
                SizedBox(height: 12,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }, child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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

