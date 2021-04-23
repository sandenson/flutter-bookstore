import 'package:flutter/material.dart';
import 'package:flutter_bookstore/favorites/favorite_book/favorite_book_widget.dart';
import 'package:flutter_bookstore/favorites/temporary_models/simple_book_model.dart';

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
          FavoriteBookWidget(
            book: books[0],
            appContext: appContext,
          ),
          FavoriteBookWidget(
            book: books[1],
            appContext: appContext,
          ),
          FavoriteBookWidget(
            book: books[2],
            appContext: appContext,
          ),
          FavoriteBookWidget(
            book: books[3],
            appContext: appContext,
          ),
          FavoriteBookWidget(
            book: books[4],
            appContext: appContext,
          ),
        ],
      ),
    );
  }
}
