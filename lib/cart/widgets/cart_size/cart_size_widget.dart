import 'package:flutter/material.dart';

class CartSizeWidget extends StatelessWidget {
  final int cartSize;

  const CartSizeWidget({Key? key, required this.cartSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
