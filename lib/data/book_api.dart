import 'dart:convert';

import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookApi {
  Future<List<BookModel>> carregarBooks() async {
    String url = 'flutter-bookstore.herokuapp.com';
    String path = '/books';

    final response = await http.get(Uri.https(url, path));

    List<BookModel> listaBooks = <BookModel>[];
    if (response.statusCode == 200) {
      final list = json.decode(response.body);
      for (var el in list) {
        listaBooks.add(BookModel.fromJson(el));
      }
    } else {
      throw new Exception('Ocorreu um erro');
    }

    return listaBooks;
  }
}
