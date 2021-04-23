import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/widget/cart_size/cart_size_widget.dart';
import 'package:flutter_bookstore/cart/widget/search_field/search_field_widget.dart';
import 'package:flutter_bookstore/models/book_model.dart';
import 'package:intl/intl.dart';
import '../favorites/favorites.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    List<BookModel> books = [
      new BookModel(
        title: 'A Arte da Guerra',
        author: 'Sun Tzu',
        price: 7.99,
        year: 2012,
        language: 'Português',
      ),
      new BookModel(
        title: 'Dom Quixote - Livro Primeiro',
        author: 'Miguel de Cervantes',
        price: 10,
        year: 205,
        language: 'Inglês',
      ),
    ];
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: buildScreen(books),
      ),
    );
  }

  Column buildScreen(List<BookModel> books) => Column(
        children: [
          SearchFieldWidget(),
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    CartSizeWidget(cartSize: 2),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: books.length,
                      itemBuilder: (context, index) => buildBook(books[index]),
                      scrollDirection: Axis.vertical,
                    ),
                    buildTotal(books),
                    buildCheckOutButton(),
                  ],
                ),
              ),
            ],
          ),
        ],
      );

  Container buildCheckOutButton() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(color: Colors.white),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(40, 40))),
              onPressed: () => {},
              child: Text(
                'FINALIZAR PEDIDO',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildTotal(List<BookModel> books) {
    NumberFormat formatter = NumberFormat.currency(
      locale: 'pt-br',
      name: '',
      symbol: 'R\$',
    );

    return Container(
      margin: EdgeInsetsDirectional.only(top: 35),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.grey[300]!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total do carrinho'),
          Text(
            formatter.format(
              books
                  .map((book) => book.price)
                  .reduce((value, element) => value + element),
            ),
          )
        ],
      ),
    );
  }

  Container buildBook(BookModel book) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.grey[300]!,
        ),
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBookNameAndPrice(book.title, book.price),
          Text(
            book.author,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Ano: ${book.year}',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            'Idioma: ${book.language}',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Row buildBookNameAndPrice(String title, double price) {
    NumberFormat formatter = NumberFormat.currency(
      locale: 'pt-br',
      name: '',
      symbol: 'R\$',
    );

    return;
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF00bdb1),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.white,
            size: 27,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Favorite()),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart_rounded,
            color: Colors.white,
            size: 27,
          ),
        ),
      ],
      centerTitle: true,
      title: Text(
        'BibliOnline',
      ),
    );
  }
}
