import 'package:book_store/feature/books/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  final search = PublishSubject<String>();
@override
  void initState() {
  search.debounceTime(Duration(milliseconds: 500)).listen((v) {
    context.read<BookCubit>().searchBooks(v ??"");
  });
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_new,size: 24)),
        title: TextFormField(
          //with each char you write
          onChanged: (v){
            search.add(v);
          },
          autofocus:true,
          cursorColor: Colors.pink,
          decoration: InputDecoration(
            hintText: "Search",
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.pink
              ),
            ),
          ),
        ),
      ),
    );
  }
}
