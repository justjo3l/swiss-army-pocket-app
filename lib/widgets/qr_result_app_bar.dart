import 'package:flutter/material.dart';

import '../animations/fade_animation.dart';

class QrResultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Icon titleIcon;

  const QrResultAppBar({
    Key? key,
    required this.titleText,
    required this.titleIcon,
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
        leading: titleIcon,
        title: Text(
          titleText,
        ),
      ),
      direction: 'down',
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
