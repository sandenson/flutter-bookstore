import 'package:flutter/material.dart';
import 'package:flutter_bookstore/home/widgets/books_on_sale_row/books_on_sale_widget.dart';
import 'package:flutter_bookstore/home/widgets/home_search_bar/home_search_bar_widget.dart';
import 'package:flutter_bookstore/home/widgets/most_sold_books_row/most_sold_books_row_widget.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';

class HomePageWidget extends StatelessWidget {
  final List<BookModel> books;
  final BuildContext appContext;

  HomePageWidget({
    Key? key,
    required this.books,
    required this.appContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          HomeSearchBarWidget(),
          Container(
            color: Colors.teal,
            padding: EdgeInsets.all(16),
            child: Text(
              'Compre milhares de livros novos, usados e seminovos de milhares de sebos e livrarias do país',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 50), // EdgeInsets.all(7),
            child: Column(children: [
              Text(
                'Conheça os livros mais vendidos da BibliOnline:',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              MostSoldBooksWidgets(
                booksList: books,
                appContext: appContext,
              ),
              Text(
                'Ofertas da semana do Consumidor: Novas ofertas todos os dias',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              BooksOnSaleWidget(
                booksList: books,
                appContext: appContext,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
