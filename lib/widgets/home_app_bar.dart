import 'package:flutter/material.dart';
import 'package:swiss_army_pocket_app/main.dart';

import '../animations/fade_animation.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  const HomeAppBar({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 0,
      child: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).primaryIconTheme,
        titleTextStyle: Theme.of(context).primaryTextTheme.headline6,
        actionsIconTheme: Theme.of(context).primaryIconTheme,
        leading: const ImageIcon(
          AssetImage('assets/knife_icon.png'),
          color: Colors.white,
          size: 1,
        ),
        title: Text(
          titleText,
        ),
        actions: <Widget>[
          Visibility(
            child: IconButton(
              icon: const Icon(Icons.light_mode),
              onPressed: () => MainApp.of(context).changeTheme(ThemeMode.dark),
            ),
            visible: Theme.of(context).brightness == Brightness.light ? true : false,
          ),
          Visibility(
              child: IconButton(
                icon: const Icon(Icons.dark_mode),
                onPressed: () => MainApp.of(context).changeTheme(ThemeMode.light),
              ),
              visible: Theme.of(context).brightness == Brightness.dark ? true : false),
        ],
      ),
      direction: 'down',
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
