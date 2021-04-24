import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/widgets/cart/cart_widget.dart';
import 'package:flutter_bookstore/favorites/favorites.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/app_bar_widget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(cart: true, appContext: context),
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
              MaterialPageRoute(builder: (context) => FavoritesPage()),
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
