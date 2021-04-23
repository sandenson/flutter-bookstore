import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookNameAndPriceWidget extends StatelessWidget {
  final String title;
  final double price;

  const BookNameAndPriceWidget({
    Key? key,
    required this.title,
    required this.price,
    this.formatter = NumberFormat.currency(
      locale: 'pt-br',
      name: '',
      symbol: 'R\$',
    ),
  }) : super(key: key);

  final NumberFormat formatter;

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
      ),
    );
  }
}
