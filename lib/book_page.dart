import 'package:flutter/material.dart';
import 'cart.dart';
import 'favorites.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class StarDisplay extends StatelessWidget {
  final double value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < value && value >= index.toDouble() + 0.75)
          return IconTheme(
            data: IconThemeData(
              color: Colors.amber,
              size: 20,
            ),
            child: Icon(Icons.star),
          );
        else if (index < value && value <= index.toDouble() + 0.25)
          return IconTheme(
            data: IconThemeData(
              color: Colors.grey[500],
              size: 20,
            ),
            child: Icon(Icons.star_border),
          );
        else
          return IconTheme(
            data: IconThemeData(
              color: Colors.amber,
              size: 20,
            ),
            child: Icon(Icons.star_half),
          );
      }),
    );
  }
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
        buildInfo(image, type, title, author, rating, nRatings),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: buildButtonsRow(),
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
        buildReviews(),
      ],
    );
  }

  buildButton(IconTheme theme, String text) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
        Color(0xFF02a69c),
      )),
      onPressed: null,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: theme,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(
          IconTheme(
            data: IconThemeData(
              color: Colors.amber,
              size: 20,
            ),
            child: Icon(Icons.star),
          ),
          "Ler avaliações",
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: buildButton(
            IconTheme(
              data: IconThemeData(
                color: Colors.grey[400],
                size: 20,
              ),
              child: Icon(Icons.favorite_rounded),
            ),
            "Adicionar aos favoritos",
          ),
        ),
      ],
    );
  }

  buildInfo(String image, String type, String title, String author,
      double rating, int nRatings) {
    return Container(
      child: Flexible(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.network(
                image,
                height: 180,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        type,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                        softWrap: true,
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        author,
                        style: TextStyle(
                          color: Colors.blue[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: StarDisplay(value: rating),
                    ),
                    Text(
                        rating.toString() +
                            " de 5 estrelas (" +
                            nRatings.toString() +
                            " avaliações)",
                        style: TextStyle(fontSize: 12))
                  ],
                ),
              ),
            ),
          ],
        ),
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

  buildReviews() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "AVALIAÇÕES",
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey[700],
            ),
          ),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide.merge(
                BorderSide(
                  width: 1,
                  color: Color(0xFFdaebee),
                ),
                BorderSide(
                  width: 1,
                  color: Color(0xFFdaebee),
                ),
              ),
            ),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: reviews.length,
          itemBuilder: (context, i) {
            return buildReview(reviews[i]);
          },
        ),
      ],
    );
  }

  buildReview(Review review) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Flexible(
            child: Row(
              children: [
                StarDisplay(value: review.rating),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Expanded(
                    child: Text(
                      review.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
                text: "Por: ",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                children: [
                  TextSpan(
                    text: review.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ", em ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: review.date,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
          SizedBox(height: 8),
          Text(
            review.text,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Color(0xFFdaebee),
          ),
        ),
      ),
    );
  }
}

class Review {
  const Review({this.title, this.username, this.rating, this.date, this.text});

  final String title;
  final String text;
  final String username;
  final double rating;
  final String date;
}

const List<Review> reviews = const <Review>[
  const Review(
    title: "Excelente",
    text:
        "É tão único e interessante que praticamente li tudo de uma vez. Do enredo aos personagens, tudo sobre ele foi ótimo. É meu prazer culpado.",
    username: "IceWelder",
    rating: 4.5,
    date: "22/03/2021",
  ),
  const Review(
    title: "💎, 8.3",
    text:
        "Em uma estória por trás simplista e choca, seus diálogos; ação e reação das personagens e originalidade engrandecem e muito o quesito obra",
    username: "Ig0y",
    rating: 4.15,
    date: "22/03/2021",
  ),
  const Review(
    title: "Muito bom",
    text:
        "Um show de roteiro. Eu louvo demais o Nisio Isin pelos diálogos absurdos e construção de personagens maravilhosa.",
    username: "AlexandreEsteves",
    rating: 4.5,
    date: "22/03/2021",
  ),
];
