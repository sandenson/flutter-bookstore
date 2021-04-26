import 'package:flutter/material.dart';
import 'package:flutter_bookstore/login/login_page.dart';
import 'package:flutter_bookstore/shared/widgets/menu_drawer/navigation_button/navigation_button_widget.dart';

class MenuDrawer extends StatelessWidget {
  final String name;

  const MenuDrawer({
    Key? key,
    this.name = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF00bdb1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this.name.isNotEmpty
              ? [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 21,
                      right: 10,
                      bottom: 20,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "Olá, ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        children: [
                          TextSpan(
                            text: name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          TextSpan(
                            text: ".",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // child: Text(
                    //   ('Olá, ' + this.name).toUpperCase(),
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 16,
                    //   ),
                    // ),
                  ),
                  NavigationButtonWidget(text: 'Minha lista'),
                  NavigationButtonWidget(text: 'Sair'),
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
}
