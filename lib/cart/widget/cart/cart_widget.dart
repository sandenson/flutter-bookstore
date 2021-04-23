import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/widget/book_cart_info/book_cart_info_widget.dart';
import 'package:flutter_bookstore/cart/widget/cart_size/cart_size_widget.dart';
import 'package:flutter_bookstore/cart/widget/checkout_out_button/check_out_button_widget.dart';
import 'package:flutter_bookstore/cart/widget/search_field/search_field_widget.dart';
import 'package:flutter_bookstore/cart/widget/total/total_widget.dart';
import 'package:flutter_bookstore/models/book_model.dart';

class CartWidget extends StatefulWidget {
  CartWidget({
    Key? key,
  }) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

List<BookModel> books = [
  new BookModel(
    imageUrl: "https://avatars.githubusercontent.com/u/29125169?v=4",
    title: 'A Arte da Guerra',
    author: 'Sun Tzu',
    description: "Aquele livro lá de estratégia e tal.",
    type: "Livro",
    price: 7.99,
    year: 2012,
    language: 'Português',
  ),
  new BookModel(
    imageUrl: "https://avatars.githubusercontent.com/u/29125169?v=4",
    title: 'Dom Quixote - Livro Primeiro',
    author: 'Miguel de Cervantes',
    description:
        "Aquele livro lá do fidalgo louco e seu escudeiro Sancho Pança.",
    type: "Livro",
    price: 10,
    year: 205,
    language: 'Inglês',
  ),
];

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                      itemBuilder: (context, index) =>
                          BookCartInfoWidget(book: books[index]),
                      scrollDirection: Axis.vertical,
                    ),
                    TotalWidget(books: books),
                    CheckOutButtonWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
