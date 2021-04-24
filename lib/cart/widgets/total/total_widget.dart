import 'package:flutter/material.dart';
import 'package:flutter_bookstore/models/book_model.dart';

class TotalWidget extends StatelessWidget {
  final List<BookModel> books;

  const TotalWidget({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 35),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.grey[300]!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total do carrinho'),
          Text(
            "R\$ ${books.map((book) => book.price).reduce((value, element) => value + element).toStringAsFixed(2)}",
          )
        ],
      ),
    );
  }
}
