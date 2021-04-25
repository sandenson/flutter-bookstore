import 'package:flutter/material.dart';
import 'package:flutter_bookstore/home/widgets/home_page/home_page_widget.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/app_bar_widget.dart';
import '../shared/widgets/menu_drawer/menu_drawer_widget.dart';
import 'package:flutter_bookstore/data/book_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<BookModel>> listaBooks;

  @override
  void initState() {
    super.initState();
    listaBooks = BookApi().getBooks();

    print("a");
    print(listaBooks);
    listaBooks.then((value) => print(value[1].author));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(home: true, appContext: context),
      body: FutureBuilder<List<BookModel>>(
          future: listaBooks,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Ocorreu um erro inesperado'));
            }

            if (snapshot.hasData) {
              return HomePageWidget(books: snapshot.data!, appContext: context);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      drawer: MenuDrawer(),
    );
  }
}
