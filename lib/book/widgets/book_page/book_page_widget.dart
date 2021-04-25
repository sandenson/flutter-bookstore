import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/widgets/book_info/book_info_widget.dart';
import 'package:flutter_bookstore/book/widgets/buttons_row/buttons_row_widget.dart';
import 'package:flutter_bookstore/book/widgets/reviews_list/reviews_list_widget.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';

class BookPageWidget extends StatefulWidget {
  final BookModel book;

  BookPageWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  _BookPageWidgetState createState() => _BookPageWidgetState();
}

class _BookPageWidgetState extends State<BookPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: [
          BookInfoWidget(
            image: widget.book.imageUrl,
            type: widget.book.type,
            title: widget.book.title,
            author: widget.book.author,
            rating: widget.book.rating,
            nRatings: widget.book.nRatings,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ButtonsRowWidget(),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.book.description,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Preço: R\$ " +
                      widget.book.price.toString().replaceFirst(RegExp('.'),
                          ',', widget.book.price.toString().length - 3),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[700],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Color(0xFF02a69c),
                  )),
                  onPressed: null,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "COMPRAR",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ReviewsListWidget(),
        ],
      ),
    );
  }
}
