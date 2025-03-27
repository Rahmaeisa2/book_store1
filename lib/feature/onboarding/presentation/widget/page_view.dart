import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String imageUrl;
  final String text;
  const PageViewItem({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.network(imageUrl),
          SizedBox(
            height: 17,
          ),
          Text(textAlign: TextAlign.center,
            text, style: TextStyle(
            fontSize: 20,
              fontWeight: FontWeight.bold
          ),),

        ],

    );
  }
}
