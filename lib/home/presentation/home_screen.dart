import 'package:book_store/home/presentation/widget/best_seller.dart';
import 'package:book_store/home/presentation/widget/new_arrival.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widget/app_bart.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForHomeScreen(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0 ,
        horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Best seller for you",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
            SizedBox(height: 20),
            // Expanded allows the list to take available space
            SizedBox(
              height: 150.h,
              child: NewArrivalseListView(),
            ),
            SizedBox(height: 20),
            Text('Best Seller',style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20),

            Expanded(child: BestSellerListView()),
          ],
        ),
      ),
    );
  }
}
