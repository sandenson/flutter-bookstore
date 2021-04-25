import 'dart:convert';

import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:http/http.dart' as http;

class AllBooksApi {
  final int bookId;

  AllBooksApi({required this.bookId});

  void getBook() async {
    // Future<BookModel> getBook() async {
    String url = 'flutter-bookstore.herokuapp.com';
    String path = '/book/$bookId';

    final response = await http.get(Uri.https(url, path));

    if (response.statusCode == 200) {
      final book = jsonDecode(response.body).map((e) => BookModel.fromMap(e));

      print(book);
      // return book;
    } else {
      throw new Exception('Ocorreu um erro');
    }
  }
}
