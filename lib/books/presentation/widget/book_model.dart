import 'package:book_store/book_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/products_model.dart';


class BookItem extends StatelessWidget {
  final Book? book;
  final void Function()? onTap;
  const BookItem({super.key, required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(

            border: Border.all(width: .5,color: Colors.grey.shade500)
        ),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(book?.image??"https://img.freepik.com/free-vector/book-with-lighbulb-cartoon-vector-icon-illustration-object-education-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-4009.jpg",
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.r),
                    margin: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white
                    ),
                    child: Icon(Icons.favorite_border),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
            ,Text(book?.name??"",),
            Text(book?.category??"",style: TextStyle(
    color: Colors.grey

    )
            ),
            Row(
              children: [
                Expanded(child: Text("${book?.price} \$")),
                Container(
                  padding: EdgeInsets.all(8.r),
                  margin: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color:Colors.pink
                  ),
                  child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}