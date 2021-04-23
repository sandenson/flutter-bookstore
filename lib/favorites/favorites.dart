import 'package:flutter/material.dart';
import '../book/book_page.dart';
import '../cart/cart.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
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
      buildHeader("Jorge", 1),
      gridContainer(context)
    ]);
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 27,
          ),
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
      backgroundColor: Color(0xFF00bdb1),
      title: Align(
        alignment: Alignment.center,
        child: Text(
          'Biblionline',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  buildHeader(String userName, int bookNumber) {
    String nBooks = bookNumber.toString();
    String livros = bookNumber == 1 ? nBooks + " livro" : nBooks + " livros";
    return Container(
        margin: EdgeInsets.all(8),
        child: Column(children: [
          Text(
            "Favoritos",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          RichText(
              text: TextSpan(
                  text: "por ",
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[600]),
                  children: [
                TextSpan(
                  text: userName,
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " - " + livros,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                )
              ]))
        ]));
  }

  createBook(SimpleBook book, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookPage()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Image.network(book.image, height: 180, fit: BoxFit.fitHeight),
              Padding(
                padding:
                    EdgeInsets.all(10), // EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  book.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(book.author),
              )
            ],
          ),
        ),
      ),
    );
  }

  final List<SimpleBook> bookList = const <SimpleBook>[
    SimpleBook(
        title: "Quincas Borba",
        image:
            "http://d1pkzhm5uq4mnt.cloudfront.net/imagens/capas/e46ef4365583e6c89069b2d90eb2683a627fc2d1.jpg",
        author: "Machado de Assis"),
    SimpleBook(
        title: "Memórias Póstumas de Brás Cubas",
        image:
            "https://i.pinimg.com/originals/9e/e1/b9/9ee1b937cdba213b565d8053c0bfd558.webp",
        author: "Machado de Assis"),
    SimpleBook(
        title: "Nas Montanhas da Loucura",
        image: "https://m.media-amazon.com/images/I/51Fh7zG+C0L.jpg",
        author: "H. P. Lovecraft"),
    SimpleBook(
        title: "Junji Ito's Cat Diary: Yon & Mu",
        image:
            "https://media.hugendubel.de/shop/coverscans/240/24033121_24033121_xl.jpg",
        author: "Junji Ito"),
    SimpleBook(
        title: "1984",
        image:
            "http://lojasaraiva.vteximg.com.br/arquivos/ids/12101548/1008972955.jpg?v=637142220125430000",
        author: "George Orwell"),
  ];

  gridContainer(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          createBook(
            bookList[0],
            context,
          ),
          createBook(
            bookList[1],
            context,
          ),
          createBook(
            bookList[2],
            context,
          ),
          createBook(
            bookList[3],
            context,
          ),
          createBook(
            bookList[4],
            context,
          ),
        ],
      ),
    );
  }
}

class SimpleBook {
  const SimpleBook({
    required this.title,
    required this.image,
    required this.author,
  });

  final String title;
  final String image;
  final String author;
}
