import 'package:flutter/material.dart';

class BookNameAndPriceWidget extends StatelessWidget {
  final String title;
  final double price;

  const BookNameAndPriceWidget({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Text(
                "R\$ ${price.toStringAsFixed(2)}",
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
      ),
    );
  }
}
