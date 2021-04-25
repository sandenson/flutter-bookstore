import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/widgets/book_page/book_page_widget.dart';
import 'package:flutter_bookstore/cart/cart.dart';
import 'package:flutter_bookstore/favorites/favorites.dart';
import 'package:flutter_bookstore/shared/models/book_model.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/app_bar_widget.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final BookModel book = BookModel(
    imageUrl:
        "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2014/10/391946-novelas-ligeras-convertidas-manganime.png?itok=5nWwtbY3",
    title: "Bakemonogatari - Livro 1",
    author: "NISIOISIN",
    description:
        'Bakemonogatari segue a história de Koyomi Araragi, um estudante do terceiro ano do ensino médio que é um "quase-humano" após ter brevemente se tornado um vampiro. Um dia, uma colega de classe chamada Hitagi Senjougahara, que nunca fala com ninguém, cai das escadarias da escola direto nos braços de Koyomi. Ele então descobre que ela pesa quase nada, desafiando as leis da física. Mesmo sendo ameaçado por ela e avisado para que ficasse longe e esquecesse o que presenciou, Koyomi oferece ajuda e a apresenta a Meme Oshino, um estranho homem de meia idade que vive num prédio abandonado, que o fez voltar a ser humano novamente.',
    type: "Light novel",
    price: 16.95,
    year: 2006,
    language: "English",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appContext: context,
      ),
      body: BookPageWidget(
        book: book,
        rating: 4.48,
        nRatings: 8001,
      ),
    );
  }
}
