import 'package:flutter/material.dart';

class BookPageHeaderWidget extends StatelessWidget {
  final String name;
  final int numberOfBooks;

  const BookPageHeaderWidget({
    Key? key,
    required this.name,
    required this.numberOfBooks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String nBooks = numberOfBooks.toString();
    final String books =
        numberOfBooks == 1 ? nBooks + " livro" : nBooks + " livros";

    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            "Favoritos",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          RichText(
              text: TextSpan(
                  text: "por ",
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[600]),
                  children: [
                TextSpan(
                  text: name,
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " - " + books,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                )
              ]))
        ],
      ),
    );
  }
}
