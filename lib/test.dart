import 'package:flutter/material.dart';

import 'feature/splash/presentation/splash.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      body: Center(
        child: Text("Home" ,
        style: TextStyle(
          fontSize: 30
        ),),
      ),
    );
  }
}
