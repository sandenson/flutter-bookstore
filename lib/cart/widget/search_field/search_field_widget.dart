import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(style: BorderStyle.solid, color: Color(0xFF00bdb1)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: 'Que livro você procura?',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Icon(
              Icons.search,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
