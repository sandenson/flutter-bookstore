import 'package:flutter/material.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:flutter_bookstore/shared/widgets/book_card/book_card_widget.dart';

class BooksOnSaleWidget extends StatelessWidget {
  final List<BookModel> booksList;
  final BuildContext appContext;

  const BooksOnSaleWidget({
    Key? key,
    required this.appContext,
    required this.booksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: booksList.length,
        itemBuilder: (context, i) {
          return BookCardWidget(book: booksList[i], appContext: appContext);
        },
      ),
    );
  }
}
