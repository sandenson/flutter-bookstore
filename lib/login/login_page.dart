import 'package:flutter/material.dart';
import 'package:flutter_bookstore/login/login_page/login_page_widget.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/app_bar_widget.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        login: true,
        appContext: context,
      ),
      body: LoginPageWidget(),
    );
  }
}
