import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bookstore/home/widgets/home_page/home_page_widget.dart';
import 'package:flutter_bookstore/shared/data/all_books_api.dart';
import 'package:flutter_bookstore/shared/models/user_model.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/widgets/menu_drawer/menu_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<HomePageStateModel> state;
  String username = '';

  Future<UserModel> getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userModelJson = prefs.getString('user')!;

    UserModel user = jsonDecode(userModelJson) as UserModel;

    return user;
  }

  @override
  void initState() {
    super.initState();
    state = BooksApi().getHomeBooks();

    getValuesSF().then((value) => {print(value)});
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(home: true, appContext: context),
      body: FutureBuilder<HomePageStateModel>(
        future: state,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Ocorreu um erro inesperado'));
          }

          if (snapshot.hasData) {
            return HomePageWidget(state: snapshot.data!, appContext: context);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      drawer: MenuDrawer(
          // username: username,
          ),
    );
  }
}
