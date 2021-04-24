import 'package:flutter/material.dart';
import 'package:flutter_bookstore/login/login_page/login_page_widget.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 30,
              color: Colors.white,
            ),
            width: 50,
          ),
          Container(
            color: Colors.brown[500],
            child: Icon(Icons.shopping_cart, size: 30, color: Colors.white),
            width: 50,
          )
        ],
        centerTitle: true,
        backgroundColor: Color(0xFF00bdb1),
      ),
      body: LoginPageWidget(),
    );
  }
}
