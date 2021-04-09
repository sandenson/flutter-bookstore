import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book.dart';
// import 'package:flutter_application_1/book.dart';
import 'package:intl/intl.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    List<Book> books = [
      new Book(
        title: 'A Arte da Guerra',
        author: 'Sun Tzu',
        price: 7.99,
        year: 2012,
        weight: '250g',
        language: 'Português',
      ),
      new Book(
        title: 'Dom Quixote - Livro Primeiro',
        author: 'Miguel de Cervantes',
        price: 10,
        year: 205,
        weight: '390g',
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

  Column buildScreen(List<Book> books) => Column(
        children: [
          buildSearchField(),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                buildCartSize(2),
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

  Container buildTotal(List<Book> books) {
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
          color: Colors.grey[300],
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

  Container buildBook(Book book) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.grey[300],
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
            'Peso: ${book.weight}',
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Text(
              formatter.format(price),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.highlight_remove_outlined,
              color: Colors.grey,
              size: 27,
            ),
          ],
        ),
      ],
    );
  }

  Container buildCartSize(int cartSize) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 30),
      child: Row(
        children: [
          Text(
            'Carrinho ($cartSize item' + (cartSize != 1 ? 's' : '') + ')',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Container buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(style: BorderStyle.solid, color: Color(0xFF00bdb1)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: 'Que livro você procura?',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Icon(
              Icons.search,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF00bdb1),
      actions: [
        Icon(Icons.favorite_border),
        Container(
          margin: EdgeInsets.only(left: 16),
          color: Colors.brown[600],
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.shopping_cart_rounded)),
        )
      ],
      centerTitle: true,
      title: Text(
        'BibliOnline',
      ),
    );
  }
}
