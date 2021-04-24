import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/widgets/review/review_widget.dart';
import 'package:flutter_bookstore/shared/models/review_model.dart';

class ReviewsListWidget extends StatelessWidget {
  const ReviewsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "AVALIAÇÕES",
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[700],
              ),
            ),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide.merge(
                  BorderSide(
                    width: 1,
                    color: Color(0xFFdaebee),
                  ),
                  BorderSide(
                    width: 1,
                    color: Color(0xFFdaebee),
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: reviews.length,
            itemBuilder: (context, i) {
              return ReviewWidget(review: reviews[i]);
            },
          ),
        ],
      ),
    );
  }

  final List<ReviewModel> reviews = const <ReviewModel>[
    const ReviewModel(
      title: "Excelente",
      text:
          "É tão único e interessante que praticamente li tudo de uma vez. Do enredo aos personagens, tudo sobre ele foi ótimo. É meu prazer culpado.",
      username: "IceWelder",
      rating: 4.5,
      date: "22/03/2021",
    ),
    const ReviewModel(
      title: "💎, 8.3",
      text:
          "Em uma estória por trás simplista e choca, seus diálogos; ação e reação das personagens e originalidade engrandecem e muito o quesito obra",
      username: "Ig0y",
      rating: 4.15,
      date: "22/03/2021",
    ),
    const ReviewModel(
      title: "Muito bom",
      text:
          "Um show de roteiro. Eu louvo demais o Nisio Isin pelos diálogos absurdos e construção de personagens maravilhosa.",
      username: "AlexandreEsteves",
      rating: 4.5,
      date: "22/03/2021",
    ),
  ];
}
