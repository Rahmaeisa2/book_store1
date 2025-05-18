import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/home_cubit.dart';
import 'home_book_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<HomeCubit,HomeState>(
          buildWhen: (prev,current)=>current is BestSellerSuccess|| current is BestSellerError|| current is BestSellerLoading,
          builder: (context,state){
            if(state is BestSellerLoading){
              return Center(child: CircularProgressIndicator());
            }else if(state is BestSellerSuccess){
              return  ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index)=>HomeBookItem(
                    image: state.books[index].image??"",
                  ),
                  separatorBuilder: (context,index)=>SizedBox(height: 15,), itemCount: state.books.length);
            }else if(state is BestSellerError){
              return Text("Error");
            }else{
              return SizedBox.shrink();
            }
          }

      ),
    );
  }
}