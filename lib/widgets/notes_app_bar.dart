import 'package:flutter/material.dart';

import '../pages/notes.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Icon titleIcon;

  const NotesAppBar({
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
      actions: <Widget>[
        Visibility(
          child: IconButton(
            icon: const Icon(Icons.view_list),
            onPressed: () => NotesScreen.of(context).changeView(false),
          ),
          visible: NotesScreen.of(context).notesListViewStatus == true ? true : false,
        ),
        Visibility(
            child: IconButton(
              icon: const Icon(Icons.grid_view),
              onPressed: () => NotesScreen.of(context).changeView(true),
            ),
            visible: NotesScreen.of(context).notesListViewStatus == false ? true : false),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
