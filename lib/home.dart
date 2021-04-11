import 'package:flutter/material.dart';
import 'menu_drawer.dart';
import 'cart.dart';
import 'book_page.dart';
import 'favorites.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildContent(context),
      drawer: MenuDrawer(),
    );
  }
}

buildText(text, {double fontSize = 13}) {
  return Text(
    text,
    style: TextStyle(color: Colors.black, fontSize: fontSize),
  );
}

buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.teal[300],
    title: Align(
      alignment: Alignment.center,
      child: Text(
        'BibliOnline',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    // leading: IconButton(
    //   icon: Icon(
    //     Icons.menu_rounded,
    //     color: Colors.white,
    //     size: 30,
    //   ),
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => Login()),
    //     );
    //   },
    // ),
    actions: [
      // ignore: missing_required_param
      IconButton(
        icon: Icon(
          Icons.favorite_border,
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

buildContent(BuildContext context) {
  //constroi o conteúdo da pg
  return ListView(
    shrinkWrap: true,
    children: [
      Container(
        color: Colors.teal[300],
        padding: EdgeInsets.all(16),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: IconTheme(
                data: IconThemeData(color: Colors.deepOrange[800]),
                child: Icon(
                  Icons.search,
                  size: 30,
                )),
            hintText: "Que livro você procura?",
          ),
        ),
      ),
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
          buildRowMaisVendidos(context),
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
          buildRowOfertas(context),
        ]),
      ),
    ],
  );
}

createBook(String image, String title, String author, BuildContext context) {
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
            Image.network(image, height: 180, fit: BoxFit.fitHeight),
            Padding(
              padding: EdgeInsets.all(10), // EdgeInsets.symmetric(vertical: 8),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text(author),
            )
          ],
        ),
      ),
    ),
  );
}

buildRowMaisVendidos(BuildContext context) {
  //livros + vendidos na row1
  return Container(
    height: 250,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        createBook(
            'https://images-na.ssl-images-amazon.com/images/I/812ot79TCsL.jpg',
            'Capitães da Areia',
            'Jorge Amado',
            context),
        createBook('https://m.media-amazon.com/images/I/51amKTwzkPL.jpg',
            'O Morro dos Ventos Uivantes', 'Emily Brontë', context),
        createBook(
            'http://lojasaraiva.vteximg.com.br/arquivos/ids/12054945/1002909425.jpg?v=637141927089070000',
            'O Pequeno Príncipe',
            'Antoine de Saint-Exupéry',
            context),
        createBook(
            'https://a-static.mlcdn.com.br/618x463/o-diario-de-anne-frank-livro-edicao-de-luxo-capa-dura-spmix/spmixshop/6246607661/1ff2dbc6ca5728ceabbf260532d92cca.jpg',
            'O Diário de Anne Frank',
            'Anne Frank',
            context),
        createBook('https://m.media-amazon.com/images/I/51XULadddlL.jpg',
            'Dom Quixote de La Mancha', 'Miguel de Cervantes', context),
        createBook(
            'https://f.i.uol.com.br/fotografia/2017/08/11/703323-400x600-1.jpeg',
            'Harry Potter e o Enigma do Princípe',
            'JK. Rowling',
            context),
      ],
    ),
  );
}

buildRowOfertas(BuildContext context) {
  //livros em oferta na row2
  return Container(
    height: 250,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        createBook('https://m.media-amazon.com/images/I/91rtArfzScL.jpg',
            'Alice no País das Maravilhas', 'Lewis Carrol', context),
        createBook(
            'https://www.tamiresdecarvalho.com/wp-content/uploads/2019/03/91XO-9O58dL.jpg',
            'Coleção: Grandes Obras',
            'Jane Austen',
            context),
        createBook(
            'https://images.tcdn.com.br/img/img_prod/617642/a_arte_da_guerra_sun_tzu_10163_1_20190719172751.png',
            'A Arte da Guerra',
            'Sun Tzu',
            context),
        createBook(
            'https://d19qz1cqidnnhq.cloudfront.net/imagens/capas/e46ef4365583e6c89069b2d90eb2683a627fc2d1.jpg',
            'Quincas Borba',
            'Machado de Asis',
            context),
        createBook('http://i.imgur.com/MbNcr6s.jpg', 'Joyland', 'Stephen King',
            context),
        createBook(
            'https://i.pinimg.com/originals/61/de/b2/61deb298947cebaaee1751b710413085.jpg',
            'Senhora',
            'José de Alencar',
            context),
      ],
    ),
  );
}
