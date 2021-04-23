import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/widgets/book_page/book_page_widget.dart';
import 'package:flutter_bookstore/cart/cart.dart';
import 'package:flutter_bookstore/favorites/favorites.dart';
import 'package:flutter_bookstore/models/book_model.dart';

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
      appBar: buildAppBar(),
      body: BookPageWidget(
        book: book,
        rating: 4.48,
        nRatings: 8001,
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Color(0xFF00bdb1),
      title: Align(
        alignment: Alignment.center,
        child: Text(
          'BibliOnline',
          style: TextStyle(color: Colors.white),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.white,
            size: 27,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 27,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
        ),
      ],
    );
  }
}
