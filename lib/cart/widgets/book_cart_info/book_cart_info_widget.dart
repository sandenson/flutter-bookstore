import 'package:flutter/material.dart';
import 'package:flutter_bookstore/cart/widgets/book_name_and_price/book_name_and_price_widget.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';

class BookCartInfoWidget extends StatelessWidget {
  final BookModel book;

  const BookCartInfoWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.grey[300]!,
        ),
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookNameAndPriceWidget(title: book.title, price: book.price),
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
            'Idioma: ${book.language}',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
