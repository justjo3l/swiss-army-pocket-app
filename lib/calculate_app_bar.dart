// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:swiss_army_pocket_app/main.dart';

import 'animations/fade_animation.dart';

class CalculateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final titleText;
  final Icon titleIcon;

  CalculateAppBar({
    required this.titleText,
    required this.titleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 0,
      child: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).primaryIconTheme,
        titleTextStyle: Theme.of(context).primaryTextTheme.headline6,
        actionsIconTheme: Theme.of(context).primaryIconTheme,
        leading: titleIcon,
        title: Text(
          titleText,
        ),
      ),
      direction: 'down',
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
