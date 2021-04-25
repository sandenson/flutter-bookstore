import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/widgets/cart/cart_widget.dart';
import 'package:flutter_bookstore/data/all_books_api.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/app_bar_widget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<List<BookModel>> booksList;

  @override
  void initState() {
    super.initState();
    booksList = BooksApi().getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(cart: true, appContext: context),
      body: SafeArea(
        child: FutureBuilder<List<BookModel>>(
          future: booksList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Ocorreu um erro inesperado'));
            }

            if (snapshot.hasData) {
              return CartWidget(booksList: snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
