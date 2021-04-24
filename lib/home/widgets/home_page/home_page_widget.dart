import 'package:flutter/material.dart';
import 'package:flutter_bookstore/home/widgets/books_on_sale_row/books_on_sale_widget.dart';
import 'package:flutter_bookstore/home/widgets/home_search_bar/home_search_bar_widget.dart';
import 'package:flutter_bookstore/home/widgets/most_sold_books_row/most_sold_books_row_widget.dart';
import 'package:flutter_bookstore/shared/models/temporary/simple_book_model.dart';

class HomePageWidget extends StatefulWidget {
  final BuildContext appContext;

  HomePageWidget({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          HomeSearchBarWidget(),
          Container(
            color: Colors.teal,
            padding: EdgeInsets.all(16),
            child: Text(
              'Compre milhares de livros novos, usados e seminovos de milhares de sebos e livrarias do país',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 50), // EdgeInsets.all(7),
            child: Column(children: [
              Text(
                'Conheça os livros mais vendidos da BibliOnline:',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              MostSoldBooksWidgets(
                booksList: mostSoldBooksList,
                appContext: widget.appContext,
              ),
              Text(
                'Ofertas da semana do Consumidor: Novas ofertas todos os dias',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              BooksOnSaleWidget(
                booksList: booksOnSaleList,
                appContext: widget.appContext,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

final List<SimpleBookModel> mostSoldBooksList = const <SimpleBookModel>[
  SimpleBookModel(
    image: 'https://images-na.ssl-images-amazon.com/images/I/812ot79TCsL.jpg',
    title: 'Capitães da Areia',
    author: 'Jorge Amado',
  ),
  SimpleBookModel(
    image: 'https://m.media-amazon.com/images/I/51amKTwzkPL.jpg',
    title: 'O Morro dos Ventos Uivantes',
    author: 'Emily Brontë',
  ),
  SimpleBookModel(
    image:
        'http://lojasaraiva.vteximg.com.br/arquivos/ids/12054945/1002909425.jpg?v=637141927089070000',
    title: 'O Pequeno Príncipe',
    author: 'Antoine de Saint-Exupéry',
  ),
  SimpleBookModel(
    image:
        'https://a-static.mlcdn.com.br/618x463/o-diario-de-anne-frank-livro-edicao-de-luxo-capa-dura-spmix/spmixshop/6246607661/1ff2dbc6ca5728ceabbf260532d92cca.jpg',
    title: 'O Diário de Anne Frank',
    author: 'Anne Frank',
  ),
  SimpleBookModel(
    image: 'https://m.media-amazon.com/images/I/51XULadddlL.jpg',
    title: 'Dom Quixote de La Mancha',
    author: 'Miguel de Cervantes',
  ),
  SimpleBookModel(
    image: 'https://f.i.uol.com.br/fotografia/2017/08/11/703323-400x600-1.jpeg',
    title: 'Harry Potter e o Enigma do Princípe',
    author: 'JK. Rowling',
  ),
];

final List<SimpleBookModel> booksOnSaleList = const <SimpleBookModel>[
  SimpleBookModel(
    image: 'https://m.media-amazon.com/images/I/91rtArfzScL.jpg',
    title: 'Alice no País das Maravilhas',
    author: 'Lewis Carrol',
  ),
  SimpleBookModel(
    image:
        'https://www.tamiresdecarvalho.com/wp-content/uploads/2019/03/91XO-9O58dL.jpg',
    title: 'Coleção: Grandes Obras',
    author: 'Jane Austen',
  ),
  SimpleBookModel(
    image:
        'https://images.tcdn.com.br/img/img_prod/617642/a_arte_da_guerra_sun_tzu_10163_1_20190719172751.png',
    title: 'A Arte da Guerra',
    author: 'Sun Tzu',
  ),
  SimpleBookModel(
    image:
        'https://d19qz1cqidnnhq.cloudfront.net/imagens/capas/e46ef4365583e6c89069b2d90eb2683a627fc2d1.jpg',
    title: 'Quincas Borba',
    author: 'Machado de Asis',
  ),
  SimpleBookModel(
    image: 'http://i.imgur.com/MbNcr6s.jpg',
    title: 'Joyland',
    author: 'Stephen King',
  ),
  SimpleBookModel(
    image:
        'https://i.pinimg.com/originals/61/de/b2/61deb298947cebaaee1751b710413085.jpg',
    title: 'Senhora',
    author: 'José de Alencar',
  ),
];
