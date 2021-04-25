import 'dart:convert';

class ReviewModel {
  final String title;
  final String text;
  final String username;
  final double rating;
  final String date;

  const ReviewModel({
    required this.title,
    required this.username,
    required this.rating,
    required this.date,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
      'username': username,
      'rating': rating,
      'date': date,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      title: map['title'],
      text: map['text'],
      username: map['username'],
      rating: map['rating'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source));
}
