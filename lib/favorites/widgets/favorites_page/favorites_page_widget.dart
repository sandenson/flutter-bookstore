import 'package:flutter/material.dart';
import 'package:flutter_bookstore/favorites/widgets/book_page_header/book_page_header_widget.dart';
import 'package:flutter_bookstore/favorites/widgets/grid_container/grid_container_widget.dart';
import 'package:flutter_bookstore/shared/data/user_sf.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';

class FavoritesPageWidget extends StatefulWidget {
  final List<BookModel> booksList;
  final BuildContext appContext;

  FavoritesPageWidget({
    Key? key,
    required this.booksList,
    required this.appContext,
  }) : super(key: key);

  @override
  _FavoritesPageWidgetState createState() => _FavoritesPageWidgetState();
}

class _FavoritesPageWidgetState extends State<FavoritesPageWidget> {
  late Future<String> name;

  @override
  void initState() {
    super.initState();
    name = UserSF().getValuesSF();
  }

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
          FutureBuilder<String>(
            future: name,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Ocorreu um erro inesperado'));
              }

              if (snapshot.hasData) {
                return BookPageHeaderWidget(
                    name: snapshot.data!,
                    numberOfBooks: widget.booksList.length);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          //IMPORTANTE
          GridContainerWidget(books: widget.booksList, appContext: context)
        ],
      ),
    );
  }
}
