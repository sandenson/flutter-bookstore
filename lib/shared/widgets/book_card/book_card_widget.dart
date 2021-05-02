import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/book_page.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';

class BookCardWidget extends StatelessWidget {
  final BookModel book;
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
            MaterialPageRoute(
                builder: (appContext) => BookPage(bookId: book.id)),
          );
        },
        child: Container(
          width: 150,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Image.network(book.imageUrl, height: 180, fit: BoxFit.fitHeight),
              SizedBox(height: 10),
              Text(
                book.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(book.author),
            ],
          ),
        ),
      ),
    );
  }
}
