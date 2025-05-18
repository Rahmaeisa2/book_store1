import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBookItem extends StatelessWidget {
  final String image;

  const HomeBookItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image.isNotEmpty
              ? image
              : "https://img.freepik.com/free-photo/high-angle-book-coffee-cup-arrangement_23-2149871524.jpg"),
        ),
      ),
    );
  }
}
