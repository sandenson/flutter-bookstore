import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/widget/cart/cart_widget.dart';
import '../favorites/favorites.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: CartWidget(),
      ),
    );
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
          onPressed: () {},
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
