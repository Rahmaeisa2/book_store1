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
    context.read<BookCubit>().searchBooks(v.trim());
  });
super.initState();
  }
  @override
  void dispose() {
    search.close();
    super.dispose();
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
      body: BlocBuilder<BookCubit, BookState>(
    builder: (context, state) {
      if (state is SearchLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is SearchSuccess) {
        if (state.books.isEmpty) {
          return const Center(child: Text("No books found"));
        }
        return ListView.builder(
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            final book = state.books[index];
            return ListTile(
              title: Text(book.name ?? "No Name"),
              subtitle: Text(book.category ?? ""),
              leading: Image.network(
                book.image ?? "",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      } else if (state is SearchError) {
        return Center(child: Text(state.errorMessage));
      }
      return const SizedBox(); // Default UI
    },
    ),
    );
  }
}
