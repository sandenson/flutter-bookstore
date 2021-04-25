import 'package:flutter/material.dart';
import 'package:flutter_bookstore/data/all_books_api.dart';
import 'package:flutter_bookstore/favorites/widgets/favorites_page/favorites_page_widget.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/app_bar_widget.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<BookModel>> booksList;

  @override
  void initState() {
    super.initState();
    booksList = BooksApi().getBooks();

    booksList.then((value) => print(value[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        favorites: true,
        appContext: context,
      ),
      body: FutureBuilder<List<BookModel>>(
        future: booksList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Ocorreu um erro inesperado'));
          }

          if (snapshot.hasData) {
            return FavoritesPageWidget(
                booksList: snapshot.data!, appContext: context);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
