import 'package:book_store/books/presentation/books.dart';
import 'package:book_store/bottom_nav_bar/widget/nav_bar_icon.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../books/cubit/book_cubit.dart';
import '../test.dart';


class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),

    BlocProvider(
      create: (context) => BookCubit()..getBooks(),
      child: BooksScreen(),
    ),    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (_currentIndex != 2) {
          setState(() {
            _currentIndex = 2;
          });
        }
      },
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        child: Icon(Icons.search,
          color: _currentIndex == 2 ? Colors.pink : Colors.black,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 12,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavBarIcon(
              isActive: _currentIndex == 0
              , label: "Home", icon: Icons.home,
              onTap: () {
                if (_currentIndex != 0) {
                  setState(() {
                    _currentIndex = 0;
                  });
                }
              },
            ),
            BottomNavBarIcon(
              isActive: _currentIndex == 1,
              onTap: () {
                if (_currentIndex != 1) {
                  setState(() {
                    _currentIndex = 1;
                  });
                }
              }
              , label: "Books", icon: Icons.book,),
            SizedBox(),
            BottomNavBarIcon(
              isActive: _currentIndex == 3
              , onTap: () {
              if (_currentIndex != 3) {
                setState(() {
                  _currentIndex = 3;
                });
              }
            }, label: "MyCart", icon: Icons.add_shopping_cart,),
            BottomNavBarIcon(
              isActive: _currentIndex == 4,
              onTap: () {
                if (_currentIndex != 4) {
                  setState(() {
                    _currentIndex = 4;
                  });
                }
              }
              , label: "Profile", icon: Icons.person,),
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}

