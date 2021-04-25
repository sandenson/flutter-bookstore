import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/cart.dart';

class NavegateToCartButtonWidget extends StatelessWidget {
  final BuildContext appContext;

  const NavegateToCartButtonWidget({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 27,
        ),
        onPressed: () {
          Navigator.push(
            appContext,
            MaterialPageRoute(builder: (appContext) => CartPage()),
          );
        },
      ),
    );
  }
}
