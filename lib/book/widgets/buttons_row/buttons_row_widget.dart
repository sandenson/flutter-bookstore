import 'package:flutter/material.dart';
import 'package:flutter_bookstore/book/widgets/button/button_widget.dart';

class ButtonsRowWidget extends StatelessWidget {
  const ButtonsRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
            theme: IconTheme(
              data: IconThemeData(
                color: Colors.amber,
                size: 20,
              ),
              child: Icon(Icons.star),
            ),
            text: "Ler avaliações",
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ButtonWidget(
              theme: IconTheme(
                data: IconThemeData(
                  color: Colors.grey[400],
                  size: 20,
                ),
                child: Icon(Icons.favorite_rounded),
              ),
              text: "Adicionar aos favoritos",
            ),
          ),
        ],
      ),
    );
  }
}
