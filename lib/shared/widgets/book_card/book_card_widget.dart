import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/book_page.dart';
import 'package:flutter_bookstore/shared/models/temporary/simple_book_model.dart';

class BookCardWidget extends StatelessWidget {
  final SimpleBookModel book;
  final BuildContext appContext;

  const BookCardWidget({
    Key? key,
    required this.book,
    required this.appContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (appContext) => BookPage()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Image.network(book.image, height: 180, fit: BoxFit.fitHeight),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  book.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(book.author),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
