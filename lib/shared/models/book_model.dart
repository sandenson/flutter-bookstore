import 'package:flutter_bookstore/shared/models/review_model.dart';

class BookModel {
  late String imageUrl, title, author, language, type, description;
  late double price;
  late int year;
  late List<ReviewModel>? reviews;

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

  BookModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    author = json['author'];
    description = json['description'];
    type = json['type'];
    price = json['price'];
    year = json['year'];
    language = json['language'];
    reviews = json['reviews'];
  }
}
