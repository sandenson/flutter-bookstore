import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/cart.dart';
import 'package:flutter_bookstore/favorites/favorites.dart';
import 'package:flutter_bookstore/home/widgets/home_page/home_page_widget.dart';
import '../shared/widgets/menu_drawer/menu_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: HomePageWidget(appContext: context),
      drawer: MenuDrawer(),
    );
  }
}

buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.teal[300],
    title: Align(
      alignment: Alignment.center,
      child: Text(
        'BibliOnline',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    // leading: IconButton(
    //   icon: Icon(
    //     Icons.menu_rounded,
    //     color: Colors.white,
    //     size: 30,
    //   ),
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => Login()),
    //     );
    //   },
    // ),
    actions: [
      // ignore: missing_required_param
      IconButton(
        icon: Icon(
          Icons.favorite_border,
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
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 27,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
      ),
    ],
  );
}
