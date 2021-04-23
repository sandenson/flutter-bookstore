import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconTheme theme;
  final String text;

  const ButtonWidget({
    Key? key,
    required this.theme,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
