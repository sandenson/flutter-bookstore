import 'dart:convert';

import 'package:flutter_bookstore/shared/models/review_model.dart';

class BookModel {
  final int id;
  final String imageUrl;
  final String title;
  final String author;
  final String language;
  final String type;
  final String description;
  final double price;
  final int year;
  final double rating;
  final int nRatings;
  final List<ReviewModel> reviews;

  BookModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.type,
    required this.price,
    required this.year,
    required this.language,
    required this.rating,
    required this.nRatings,
    required this.reviews,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'author': author,
      'language': language,
      'type': type,
      'description': description,
      'price': price,
      'year': year,
      'rating': rating,
      'nRatings': nRatings,
      'reviews': reviews.map((x) => x.toMap()).toList(),
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      author: map['author'],
      language: map['language'],
      type: map['type'],
      description: map['description'],
      price: double.parse(map['price']),
      year: map['year'],
      rating: double.parse(map['rating']),
      nRatings: map['nreviews'],
      reviews: List<ReviewModel>.from(
          map['reviews']?.map((x) => ReviewModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));
}
