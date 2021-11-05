import 'package:flutter/material.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({Key? key}) : super(key: key);

  @override
  CompassScreenState createState() => CompassScreenState();
}

class CompassScreenState extends State<CompassScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Align(
          child: Column(
            children: [
              const Text(
                'This doesn\'t work just yet!',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const Text(
                'Give us a bit!',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: Theme.of(context).primaryColor,
                iconSize: 30,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          alignment: Alignment.center,
        ),
      ),
      onPanUpdate: (gestureDetails) {
        if (gestureDetails.delta.dy > 5) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
