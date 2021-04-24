import 'package:flutter/material.dart';
import 'package:flutter_bookstore/favorites/favorites.dart';

class NavigateToFavoritesButtonWidget extends StatelessWidget {
  final BuildContext appContext;

  const NavigateToFavoritesButtonWidget({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 27,
        ),
        onPressed: () {
          Navigator.push(
            appContext,
            MaterialPageRoute(builder: (appContext) => FavoritesPage()),
          );
        },
      ),
    );
  }
}
