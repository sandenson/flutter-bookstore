import 'dart:convert';

import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  Future<List<BookModel>> getBooks() async {
    String url = 'flutter-bookstore.herokuapp.com';
    String path = '/books';

    final response = await http.get(Uri.https(url, path));

    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      print(list[0]['rating']);

      final booksList = list.map((e) => BookModel.fromMap(e)).toList();

      return booksList;
    } else {
      throw new Exception('Ocorreu um erro');
    }
  }

  Future<HomePageStateModel> getHomeBooks() async {
    String url = 'flutter-bookstore.herokuapp.com';
    String path = '/books/sale';

    final response1 = await http.get(Uri.https(url, path));

    path = '/books/popular';

    final response2 = await http.get(Uri.https(url, path));

    if (response1.statusCode == 200 && response2.statusCode == 200) {
      final list1 = jsonDecode(response1.body) as List;
      final list2 = jsonDecode(response2.body) as List;

      final booksList1 = list1.map((e) => BookModel.fromMap(e)).toList();
      final booksList2 = list2.map((e) => BookModel.fromMap(e)).toList();

      final state = HomePageStateModel(
          booksOnSale: booksList1, mostSoldBooks: booksList2);

      return state;
    } else {
      throw new Exception('Ocorreu um erro');
    }
  }

  Future<List<BookModel>> getBooksByList(String list) async {
    String url = 'flutter-bookstore.herokuapp.com';
    String path = '/books/$list';

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

class HomePageStateModel {
  final List<BookModel> mostSoldBooks;
  final List<BookModel> booksOnSale;

  HomePageStateModel({
    required this.mostSoldBooks,
    required this.booksOnSale,
  });
}
