import 'package:book_store/book_store.dart';
import 'package:book_store/books/presentation/widget/book_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/book_cubit.dart';



class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          AppBar(
            title: Text("Books",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold
              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Min Price" ,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold
                ),),
                Text("Max Price",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                  ),),
              ],),
          ),
          BlocBuilder<BookCubit, BookState>(
            buildWhen: (prev,current)=>current is ChangeSliderValue,
            builder: (context, state) {
              var cubit=context.read<BookCubit>();
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 20
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: const SliderThemeData(
                            showValueIndicator: ShowValueIndicator.always),
                        child: RangeSlider(
                            labels:RangeLabels(cubit.startValue.toStringAsFixed(2), cubit.endValue.toStringAsFixed(2)) ,
                            activeColor: Colors.pink,
                            min: 10,
                            max: 1000
                            ,values: RangeValues(cubit.startValue, cubit.endValue), onChanged:(value){
                          cubit.changeValues(value);
                        } ),
                      ),
                    ),

                    ElevatedButton(onPressed: (){
                      cubit.booksFilter();
                    }, child: Text("Filter" , style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                    ),))
                  ],
                ),
              );
            },
          ),
          Expanded(
              child: BlocBuilder<BookCubit,BookState>(

                  buildWhen: (prev,current)=>(current is GetBooksSuccess|| current is GetBooksLoading||current is GetBooksError),

                  builder: (context,state){
                    if(state is GetBooksLoading){
                      return Center(child: CircularProgressIndicator());
                    }
                    else if(state is GetBooksSuccess){
                      debugPrint("success state ${state.books.length.toString()}");
                      return state.books.isEmpty? Text("not found"):GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16
                        ),
                        itemBuilder: (context,index)=>BookItem(
                          book: state.books[index],
                          onTap: (){
                          },
                        ),itemCount: state.books.length,
                      );
                    }else if(state is GetBooksError){
                      return Text(state.errorMessage);
                    }else{
                      return SizedBox.shrink();
                    }
                  })
          ),

        ],

    );
  }
}