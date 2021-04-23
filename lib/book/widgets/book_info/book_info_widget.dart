import 'package:flutter/material.dart';
import 'package:flutter_bookstore/shared/widgets/star_display/star_display_widget.dart';

class BookInfoWidget extends StatelessWidget {
  final String image, type, title, author;
  final double rating;
  final int nRatings;

  const BookInfoWidget({
    Key? key,
    required this.image,
    required this.type,
    required this.title,
    required this.author,
    required this.rating,
    required this.nRatings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.network(
                image,
                height: 180,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        type,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                        softWrap: true,
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        author,
                        style: TextStyle(
                          color: Colors.blue[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: StarDisplayWidget(value: rating),
                    ),
                    Text(
                        rating.toString() +
                            " de 5 estrelas (" +
                            nRatings.toString() +
                            " avaliações)",
                        style: TextStyle(fontSize: 12))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
