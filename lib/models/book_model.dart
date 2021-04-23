import 'package:flutter_bookstore/models/review_model.dart';

class BookModel {
  final String title, author, language;
  final double price;
  final int year;
  final List<ReviewModel>? reviews;

  BookModel({
    required this.title,
    required this.author,
    required this.price,
    required this.year,
    required this.language,
    this.reviews,
  });
}
