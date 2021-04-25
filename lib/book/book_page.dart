import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/widgets/book_page/book_page_widget.dart';
import 'package:flutter_bookstore/shared/data/book_api.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/app_bar_widget.dart';

class BookPage extends StatefulWidget {
  final int bookId;

  const BookPage({Key? key, required this.bookId}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  late Future<BookModel> book;

  @override
  void initState() {
    super.initState();
    book = BookApi(bookId: widget.bookId).getBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appContext: context,
      ),
      body: FutureBuilder<BookModel>(
          future: book,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Ocorreu um erro inesperado'));
            }

            if (snapshot.hasData) {
              return BookPageWidget(
                book: snapshot.data!,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
