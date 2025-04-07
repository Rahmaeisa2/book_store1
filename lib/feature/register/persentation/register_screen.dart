import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
        title: Text(
          "Register",
          style: TextStyle(
            fontSize: 23
          ),
        ),
      ),

    );
  }
}
