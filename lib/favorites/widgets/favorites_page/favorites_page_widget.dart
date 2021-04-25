import 'package:flutter/material.dart';
import 'package:flutter_bookstore/favorites/widgets/book_page_header/book_page_header_widget.dart';
import 'package:flutter_bookstore/favorites/widgets/grid_container/grid_container_widget.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';

class FavoritesPageWidget extends StatelessWidget {
  final List<BookModel> booksList;
  final BuildContext appContext;

  FavoritesPageWidget({
    Key? key,
    required this.booksList,
    required this.appContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Color(0xFF00bdb1),
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.search),
                hintText: "Que livro você procura?",
              ),
            ),
          ),
          BookPageHeaderWidget(username: "Jorge", numberOfBooks: 1),
          //IMPORTANTE
          GridContainerWidget(books: booksList, appContext: context)
        ],
      ),
    );
  }
}
