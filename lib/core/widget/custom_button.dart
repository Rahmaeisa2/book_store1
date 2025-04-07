import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color? background;
  final Function () onTap;
   CustomButton({super.key, required this.name, this.background, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:background?? Colors.pink,
          borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.pink)

        ),
        child: Text(name , style: TextStyle(
          fontSize: 20,
          color: background==null?Colors.white:Colors.pink,
        ),),

      ),
    );
  }
}
