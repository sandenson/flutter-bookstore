import 'package:flutter/material.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:flutter_bookstore/shared/widgets/book_card/book_card_widget.dart';

class MostSoldBooksWidgets extends StatelessWidget {
  final BuildContext appContext;
  final List<BookModel> booksList;

  const MostSoldBooksWidgets({
    Key? key,
    required this.booksList,
    required this.appContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
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
