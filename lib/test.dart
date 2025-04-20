import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      body: Center(
        child: Text("Done" ,
        style: TextStyle(
          fontSize: 30
        ),),
      ),
    );
  }
}
