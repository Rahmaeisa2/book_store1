import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarIcon extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool isActive;
  final void Function()? onTap;

  const BottomNavBarIcon(
      {super.key, this.icon, required this.label, this.onTap, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: isActive ? Colors.pink: Colors.black,),
          SizedBox(
            height: 8,
          )         ,
          Text(label, style: TextStyle(
              color: isActive ? Colors.pink : Colors.black
          ),)

        ],
      ),
    );
  }
}