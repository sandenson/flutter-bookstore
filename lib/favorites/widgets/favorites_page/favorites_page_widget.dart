import 'package:flutter/material.dart';
import 'package:flutter_bookstore/favorites/widgets/book_page_header/book_page_header_widget.dart';
import 'package:flutter_bookstore/favorites/widgets/grid_container/grid_container_widget.dart';
import 'package:flutter_bookstore/shared/models/temporary/simple_book_model.dart';

class FavoritesPageWidget extends StatefulWidget {
  final BuildContext appContext;

  FavoritesPageWidget({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  @override
  _FavoritesPageWidgetState createState() => _FavoritesPageWidgetState();
}

class _FavoritesPageWidgetState extends State<FavoritesPageWidget> {
  final List<SimpleBookModel> bookList = const <SimpleBookModel>[
    SimpleBookModel(
        title: "Quincas Borba",
        image:
            "http://d1pkzhm5uq4mnt.cloudfront.net/imagens/capas/e46ef4365583e6c89069b2d90eb2683a627fc2d1.jpg",
        author: "Machado de Assis"),
    SimpleBookModel(
        title: "Memórias Póstumas de Brás Cubas",
        image:
            "https://i.pinimg.com/originals/9e/e1/b9/9ee1b937cdba213b565d8053c0bfd558.webp",
        author: "Machado de Assis"),
    SimpleBookModel(
        title: "Nas Montanhas da Loucura",
        image: "https://m.media-amazon.com/images/I/51Fh7zG+C0L.jpg",
        author: "H. P. Lovecraft"),
    SimpleBookModel(
        title: "Junji Ito's Cat Diary: Yon & Mu",
        image:
            "https://media.hugendubel.de/shop/coverscans/240/24033121_24033121_xl.jpg",
        author: "Junji Ito"),
    SimpleBookModel(
        title: "1984",
        image:
            "http://lojasaraiva.vteximg.com.br/arquivos/ids/12101548/1008972955.jpg?v=637142220125430000",
        author: "George Orwell"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Color(0xFF00bdb1),
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.search),
                hintText: "Que livro você procura?",
              ),
            ),
          ),
          BookPageHeaderWidget(username: "Jorge", numberOfBooks: 1),
          //IMPORTANTE
          // GridContainerWidget(books: bookList, appContext: context)
        ],
      ),
    );
  }
}
