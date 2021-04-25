import 'package:flutter/material.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/back_button/back_button_widget.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/navigate_to_cart_button/navigate_to_cart_button_widget.dart';
import 'package:flutter_bookstore/shared/widgets/app_bar/navigate_to_favorites_button/navigate_to_favorites_button_widget.dart';

class AppBarWidget extends PreferredSize {
  final bool login, home, cart, favorites;
  final BuildContext appContext;

  AppBarWidget({
    this.login = false,
    this.home = false,
    this.cart = false,
    this.favorites = false,
    required this.appContext,
  }) : super(
          preferredSize: Size.fromHeight(60),
          child: Container(
            child: AppBar(
              backgroundColor: Colors.teal[300],
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'BibliOnline',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              leading: home == true ? null : BackButtonWidget(),
              actions: login == true
                  ? []
                  : favorites == true
                      ? [
                          NavegateToCartButtonWidget(appContext: appContext),
                        ]
                      : cart == true
                          ? [
                              NavigateToFavoritesButtonWidget(
                                  appContext: appContext),
                            ]
                          : [
                              NavigateToFavoritesButtonWidget(
                                  appContext: appContext),
                              NavegateToCartButtonWidget(
                                  appContext: appContext),
                            ],
            ),
          ),
        );
}
