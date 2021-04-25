import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/widgets/book_cart_info/book_cart_info_widget.dart';
import 'package:flutter_bookstore/cart/widgets/cart_size/cart_size_widget.dart';
import 'package:flutter_bookstore/cart/widgets/checkout_out_button/check_out_button_widget.dart';
import 'package:flutter_bookstore/cart/widgets/search_field/search_field_widget.dart';
import 'package:flutter_bookstore/cart/widgets/total/total_widget.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';

class CartWidget extends StatelessWidget {
  final List<BookModel> booksList;

  CartWidget({
    Key? key,
    required this.booksList,
  }) : super(key: key);

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
                    CartSizeWidget(cartSize: booksList.length),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: booksList.length,
                        itemBuilder: (context, index) =>
                            BookCartInfoWidget(book: booksList[index]),
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                    TotalWidget(books: booksList),
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

List<BookModel> books = [
  new BookModel(
    id: 1,
    imageUrl: "https://avatars.githubusercontent.com/u/29125169?v=4",
    title: 'A Arte da Guerra',
    author: 'Sun Tzu',
    description: "Aquele livro lá de estratégia e tal.",
    type: "Livro",
    price: 7.99,
    year: 2012,
    nRatings: 0,
    rating: 0,
    language: 'Português',
    reviews: [],
  ),
  new BookModel(
    id: 2,
    imageUrl: "https://avatars.githubusercontent.com/u/29125169?v=4",
    title: 'Dom Quixote - Livro Primeiro',
    author: 'Miguel de Cervantes',
    description:
        "Aquele livro lá do fidalgo louco e seu escudeiro Sancho Pança.",
    type: "Livro",
    price: 10,
    year: 205,
    nRatings: 0,
    rating: 0,
    language: 'Inglês',
    reviews: [],
  ),
];
