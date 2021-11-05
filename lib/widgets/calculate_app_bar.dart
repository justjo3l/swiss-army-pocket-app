import 'package:flutter/material.dart';

class CalculateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Icon titleIcon;

  const CalculateAppBar({
    Key? key,
    required this.titleText,
    required this.titleIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: Theme.of(context).primaryIconTheme,
      titleTextStyle: Theme.of(context).primaryTextTheme.headline6,
      actionsIconTheme: Theme.of(context).primaryIconTheme,
      leading: titleIcon,
      title: Text(
        titleText,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
