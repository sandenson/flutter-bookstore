import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/widgets/book_info/book_info_widget.dart';
import 'package:flutter_bookstore/book/widgets/buttons_row/buttons_row_widget.dart';
import 'package:flutter_bookstore/book/widgets/reviews_list/reviews_list_widget.dart';
import '../cart/cart.dart';
import '../favorites/favorites.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(
          "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2014/10/391946-novelas-ligeras-convertidas-manganime.png?itok=5nWwtbY3",
          "Light novel",
          "Bakemonogatari - Livro 1",
          "NISIOISIN",
          4.48,
          8001,
          'Bakemonogatari segue a história de Koyomi Araragi, um estudante do terceiro ano do ensino médio que é um "quase-humano" após ter brevemente se tornado um vampiro. Um dia, uma colega de classe chamada Hitagi Senjougahara, que nunca fala com ninguém, cai das escadarias da escola direto nos braços de Koyomi. Ele então descobre que ela pesa quase nada, desafiando as leis da física. Mesmo sendo ameaçado por ela e avisado para que ficasse longe e esquecesse o que presenciou, Koyomi oferece ajuda e a apresenta a Meme Oshino, um estranho homem de meia idade que vive num prédio abandonado, que o fez voltar a ser humano novamente.',
          16.95),
    );
  }

  buildBody(String image, String type, String title, String author,
      double rating, int nRatings, String description, double price) {
    return ListView(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      children: [
        BookInfoWidget(
          image: image,
          type: type,
          title: title,
          author: author,
          rating: rating,
          nRatings: nRatings,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: ButtonsRowWidget(),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                description,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Preço: R\$ " +
                    price.toString().replaceFirst(
                        RegExp('.'), ',', price.toString().length - 3),
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Color(0xFF02a69c),
                )),
                onPressed: null,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "COMPRAR",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ReviewsListWidget(),
      ],
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
              MaterialPageRoute(builder: (context) => Favorite()),
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
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
        ),
      ],
    );
  }
}
