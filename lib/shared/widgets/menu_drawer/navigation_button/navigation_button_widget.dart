import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget {
  final String text;

  const NavigationButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFF3e9f95),
          border: BorderDirectional(
            top: BorderSide(
              color: Colors.teal,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: Text(
                              text,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ButtonStyle(
                              // backgroundColor:
                              //     MaterialStateProperty.all<Color>(Colors.red),
                              alignment: Alignment.centerLeft,
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(0, 40),
                              ),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
