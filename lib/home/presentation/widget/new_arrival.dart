import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/home_cubit.dart';
import 'home_book_item.dart';

class NewArrivalseListView extends StatelessWidget {
  const NewArrivalseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<HomeCubit,HomeState>(

          buildWhen: (prev,current)=>current is NewArrivalsSuccess||current is NewArrivalsError||current is NewArrivalsLoading
          ,builder: (context,state){
        if(state is NewArrivalsLoading){
          return Center(child: CircularProgressIndicator());
        }else if(state is NewArrivalsSuccess){
          return  ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>HomeBookItem(
                image: state.books[index].image??"",
              ),
              separatorBuilder: (context,index)=>SizedBox(width: 17,), itemCount: state.books.length);
        }else if(state is NewArrivalsError){
          return Text("Error");
        }else{
          return SizedBox.shrink();
        }
      }

      ),
    );
  }
}
