import 'dart:convert';

import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:http/http.dart' as http;

class AllBooksApi {
  Future<List<BookModel>> getBooks() async {
    String url = 'flutter-bookstore.herokuapp.com';
    String path = '/books';

    final response = await http.get(Uri.https(url, path));

    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      final booksList = list.map((e) => BookModel.fromMap(e)).toList();

      return booksList;
    } else {
      throw new Exception('Ocorreu um erro');
    }
  }
}
