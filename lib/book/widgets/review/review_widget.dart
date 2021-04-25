import 'package:flutter/material.dart';
import 'package:flutter_bookstore/shared/models/review_model.dart';
import 'package:flutter_bookstore/shared/widgets/star_display/star_display_widget.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;

  const ReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(review);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Flexible(
            child: Row(
              children: [
                StarDisplayWidget(value: review.rating),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Expanded(
                    child: Text(
                      review.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
                text: "Por: ",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                children: [
                  TextSpan(
                    text: review.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ", em ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: review.date,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
          SizedBox(height: 8),
          Text(
            review.text,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Color(0xFFdaebee),
          ),
        ),
      ),
    );
  }
}
