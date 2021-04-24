import 'package:flutter/material.dart';
import 'package:flutter_bookstore/login/form_page/form_page_widget.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text("Para continuar, faça login",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 25,
              )),
          FormPageWidget(),
          Container(
            color: Colors.grey.shade200,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ainda não é cadastrado?'),
                Text('Crie sua conta e economize tempo na proxima compra'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
