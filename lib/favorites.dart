import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  buildBody() {
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
      gridContainer()
    ]);
  }

  buildAppBar() {
    return AppBar(
      leading: Icon(Icons.menu),
      actions: [
        Icon(Icons.favorite_border),
        Container(margin: EdgeInsets.symmetric(horizontal: 15), child: Icon(Icons.shopping_cart))
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
              text: TextSpan(text: "por ", style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey[600]), children: [
            TextSpan(
              text: userName,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: " - " + livros,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            )
          ]))
        ]));
  }

  createBook(Book book) {
    return Padding(
        
    );
  }

  final List<Book> bookList = const <Book>[
    Book(title: "Quincas Borba", image: "http://d1pkzhm5uq4mnt.cloudfront.net/imagens/capas/e46ef4365583e6c89069b2d90eb2683a627fc2d1.jpg", author: "Machado de Assis"),
    Book(title: "Memórias Póstumas de Brás Cubas", image: "https://i.pinimg.com/originals/9e/e1/b9/9ee1b937cdba213b565d8053c0bfd558.webp", author: "Machado de Assis"),
    Book(title: "Nas Montanhas da Loucura", image: "https://m.media-amazon.com/images/I/51Fh7zG+C0L.jpg", author: "H. P. Lovecraft"),
    Book(title: "Junji Ito's Cat Diary: Yon & Mu", image: "https://media.hugendubel.de/shop/coverscans/240/24033121_24033121_xl.jpg", author: "Junji Ito"),
    Book(title: "1984", image: "http://lojasaraiva.vteximg.com.br/arquivos/ids/12101548/1008972955.jpg?v=637142220125430000", author: "George Orwell"),
  ];

  gridContainer() {
    return Container(
    height: 250,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        createBook(
          bookList[0],
        ),
        createBook(
          bookList[1],
        ),
        createBook(
          bookList[2],
        ),
        createBook(
          bookList[3],
        ),
        createBook(
          bookList[4],
        ),
      ],
    ),
  );
  }
}

class Book {
  const Book({this.title, this.image, this.author});

  final String title;
  final String image;
  final String author;
}