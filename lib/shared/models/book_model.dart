import 'package:flutter_bookstore/shared/models/review_model.dart';

class BookModel {
  final String imageUrl, title, author, language, type, description;
  final double price;
  final int year;
  final List<ReviewModel>? reviews;

  BookModel({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.type,
    required this.price,
    required this.year,
    required this.language,
    this.reviews,
  });
}
