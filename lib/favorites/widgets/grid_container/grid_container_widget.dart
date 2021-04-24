import 'package:flutter/material.dart';
import 'package:flutter_bookstore/models/temporary/simple_book_model.dart';
import 'package:flutter_bookstore/shared/widgets/book_card/book_card_widget.dart';

class GridContainerWidget extends StatelessWidget {
  final List<SimpleBookModel> books;
  final BuildContext appContext;

  const GridContainerWidget({
    Key? key,
    required this.books,
    required this.appContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          BookCardWidget(
            book: books[0],
            appContext: appContext,
          ),
          BookCardWidget(
            book: books[1],
            appContext: appContext,
          ),
          BookCardWidget(
            book: books[2],
            appContext: appContext,
          ),
          BookCardWidget(
            book: books[3],
            appContext: appContext,
          ),
          BookCardWidget(
            book: books[4],
            appContext: appContext,
          ),
        ],
      ),
    );
  }
}
