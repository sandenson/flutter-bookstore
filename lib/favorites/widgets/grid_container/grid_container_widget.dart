import 'package:flutter/material.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:flutter_bookstore/shared/widgets/book_card/book_card_widget.dart';

class GridContainerWidget extends StatelessWidget {
  final List<BookModel> books;
  final BuildContext appContext;

  const GridContainerWidget({
    Key? key,
    required this.books,
    required this.appContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, i) {
          return BookCardWidget(book: books[i], appContext: appContext);
        },
      ),
    );
  }
}
