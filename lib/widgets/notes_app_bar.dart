// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, unused_import

import 'package:flutter/material.dart';
import 'package:swiss_army_pocket_app/main.dart';

import '../animations/fade_animation.dart';

import '../pages/notes.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final titleText;
  final Icon titleIcon;

  NotesAppBar({
    required this.titleText,
    required this.titleIcon,
  });

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
            icon: Icon(Icons.view_list),
            onPressed: () => NotesScreen.of(context).changeView(false),
          ),
          visible: NotesScreen.of(context).notesListViewStatus == true ? true : false,
        ),
        Visibility(
            child: IconButton(
              icon: Icon(Icons.grid_view),
              onPressed: () => NotesScreen.of(context).changeView(true),
            ),
            visible: NotesScreen.of(context).notesListViewStatus == false ? true : false),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
