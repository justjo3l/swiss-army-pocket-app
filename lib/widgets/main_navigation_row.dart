// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, annotate_overrides, avoid_print, unused_element

import 'package:flutter/material.dart';
import '../pages/notes.dart';
import '../pages/feedback.dart';
import '../pages/calculate.dart';
import '../pages/qr_scanner.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/note.dart';

import '../animations/fade_animation.dart';

class MainNavigationRow extends StatelessWidget {
  Future _notesFunction(BuildContext context) async {
    await Hive.openBox<Note>('notes');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NotesScreen(),
      ),
    );
  }

  void _feedbackFunction(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FeedbackScreen(),
      ),
    );
  }

  void _calculateFunction(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CalculateScreen(),
      ),
    );
  }

  void _qrFunction(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QrScannerScreen(),
      ),
    );
  }

  void _musicFunction(BuildContext context) {
    print('Music function');
  }

  void _compassFunction(BuildContext context) {
    print('Compass function');
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Row(
            children: [
              //FEEDBACK BUTTON
              FadeAnimation(
                delay: 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    _feedbackFunction(context);
                  },
                  child: Icon(
                    Icons.feedback,
                    size: 60,
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width * 0.25,
                        MediaQuery.of(context).size.height * 0.15,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          bottomRight: Radius.circular(50),
                          topLeft: Radius.zero,
                          bottomLeft: Radius.zero,
                        ),
                      ),
                    ),
                  ),
                ),
                direction: 'down',
              ),
              //MUSIC BUTTON
              FadeAnimation(
                delay: 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    _musicFunction(context);
                  },
                  child: Icon(
                    Icons.music_note,
                    size: 60,
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerRight,
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width * 0.25,
                        MediaQuery.of(context).size.height * 0.15,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          bottomRight: Radius.zero,
                          topLeft: Radius.zero,
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                direction: 'down',
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          alignment: Alignment.topLeft,
        ),
        Center(
          child: Row(
            children: [
              //NOTES BUTTON
              FadeAnimation(
                delay: 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    _notesFunction(context);
                  },
                  child: Icon(
                    Icons.notes_rounded,
                    size: 70,
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width * 0.25, MediaQuery.of(context).size.height * 0.35),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                          topLeft: Radius.zero,
                          bottomLeft: Radius.zero,
                        ),
                      ),
                    ),
                  ),
                ),
                direction: 'down',
              ),
              //COMPASS BUTTON
              FadeAnimation(
                delay: 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    _compassFunction(context);
                  },
                  child: Icon(
                    Icons.gps_fixed,
                    size: 70,
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width * 0.20,
                        MediaQuery.of(context).size.height * 0.220,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                direction: 'down',
              ),
              //CALCULATE BUTTON
              FadeAnimation(
                delay: 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    _calculateFunction(context);
                  },
                  child: Icon(
                    Icons.calculate_rounded,
                    size: 70,
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerRight,
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width * 0.25,
                        MediaQuery.of(context).size.height * 0.35,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          bottomRight: Radius.zero,
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                direction: 'down',
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
        Align(
          child: Row(
            children: [
              //QR BUTTON
              FadeAnimation(
                delay: 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    _qrFunction(context);
                  },
                  child: Icon(
                    Icons.qr_code_2,
                    size: 70,
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    minimumSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.height * 0.35,
                      MediaQuery.of(context).size.width * 0.20,
                    )),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.zero,
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                    ),
                  ),
                ),
                direction: 'up',
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}
