import 'dart:convert';

import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookApi {
  final int bookId;

  BookApi({required this.bookId});

  Future<BookModel> getBook() async {
    // Future<BookModel> getBook() async {
    String url = 'flutter-bookstore.herokuapp.com';
    String path = '/book/$bookId';

    final response = await http.get(Uri.https(url, path));

    if (response.statusCode == 200) {
      final bookAsList = jsonDecode(response.body) as List;

      final book = bookAsList.map((e) => BookModel.fromMap(e)).toList();

      return book[0];
    } else {
      throw new Exception('Ocorreu um erro');
    }
  }
}
