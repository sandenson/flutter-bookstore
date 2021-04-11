import 'package:flutter/material.dart';

import 'login_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key key,
    this.username = '',
  }) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF00bdb1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this.username.isNotEmpty
              ? [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 21,
                      right: 10,
                      bottom: 20,
                    ),
                    child: Text(
                      ('Olá ' + this.username).toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  navigationButton('Minha lista'),
                  navigationButton('Sair'),
                ]
              : [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 21,
                      right: 10,
                      bottom: 20,
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(200, 40)),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Text(
                        'ENTRAR',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                    ),
                  ),
                ],
        ),
      ),
    );
  }

  DecoratedBox navigationButton(String text) {
    return DecoratedBox(
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
    );
  }
}
