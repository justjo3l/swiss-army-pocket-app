// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import './fade_animation.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final titleText;

  HomeAppBar({this.titleText});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1,
      child: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).primaryIconTheme,
        titleTextStyle: Theme.of(context).primaryTextTheme.headline6,
        actionsIconTheme: Theme.of(context).primaryIconTheme,
        leading: Icon(Icons.fireplace),
        title: Text(
          titleText,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigation),
            onPressed: null,
          ),
        ],
      ),
      direction: 'down',
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
