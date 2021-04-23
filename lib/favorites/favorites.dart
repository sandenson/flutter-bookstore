import 'package:flutter/material.dart';
import 'package:flutter_bookstore/favorites/favorites_page/favorites_page_widget.dart';
import '../cart/cart.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: FavoritesPageWidget(appContext: context),
    );
  }

  buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 27,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 27,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
        ),
      ],
      backgroundColor: Color(0xFF00bdb1),
      title: Align(
        alignment: Alignment.center,
        child: Text(
          'Biblionline',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
