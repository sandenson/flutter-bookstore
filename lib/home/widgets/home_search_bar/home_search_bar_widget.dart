import 'package:flutter/material.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
