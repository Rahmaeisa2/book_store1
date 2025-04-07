import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String? hintText;

  const CustomTextFormField({super.key, required this.title, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7
            ),
            child: Text(
              title , style: TextStyle(
              fontSize: 18,
                fontWeight: FontWeight.bold,)),
          ),
          SizedBox(
            height: 7,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.pink),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14)
              ),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                )


            ),

          )
        ],



    );
  }
}
