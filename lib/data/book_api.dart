import 'dart:convert';

import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookApi {
  Future<List<BookModel>> getBooks() async {
    String url = 'flutter-bookstore.herokuapp.com';
    String path = '/books';

    final response = await http.get(Uri.https(url, path));

    // final list = jsonDecode(response.body) as List;

    // print(list[0]['price']);

    // List<BookModel> listaBooks = <BookModel>[];
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      final booksList = list.map((e) => BookModel.fromMap(e)).toList();

      return booksList;

      // final list = json.decode(response.body);
      // for (var el in list) {
      //   listaBooks.add(BookModel.fromJson(el));
      // }
    } else {
      throw new Exception('Ocorreu um erro');
    }
  }
}
