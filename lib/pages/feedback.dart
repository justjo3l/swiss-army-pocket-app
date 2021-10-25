// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable, prefer_const_declarations

import 'package:flutter/material.dart';

import '../widgets/feedback_app_bar.dart';
import '../widgets/main_navigation_row.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'notes.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  FeedbackScreenState createState() => FeedbackScreenState();
}

class FeedbackScreenState extends State<FeedbackScreen> {
  var formKey = GlobalKey<FormState>();

  late String feedbackUserName;
  late String feedback;

  Future sendEmail({
    required String name,
    required String message,
  }) async {
    final serviceId = 'service_vyrxk0v';
    final templateId = 'template_a65ffal';
    final userId = 'user_k4M95FE9Yv9A6c9uawHWb';
    final accessToken = 'b98fa719e97e36d4263ccec1039f4b2c';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'accessToken': accessToken,
        'template_params': {
          'sender_name': name,
          'mail_message': message,
        },
      }),
    );
  }

  void feedbackButtonClicked() {
    formKey.currentState!.save();
    sendEmail(
      name: feedbackUserName,
      message: feedback,
    );
    Navigator.of(context).pop();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'Thanks for the feedback!',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: FeedbackAppBar(
            titleText: 'Feedback & Tips',
            titleIcon: Icon(Icons.feedback_sharp),
          ),
          body: Form(
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your name',
                      ),
                      validator: (text) {
                        text!.isEmpty ? 'Name is required!' : null;
                      },
                      onSaved: (String? value) {
                        feedbackUserName = value as String;
                      },
                    ),
                    margin: EdgeInsets.all(25.0),
                  ),
                  Container(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your Feedback/Tip',
                      ),
                      validator: (text) {
                        text!.isEmpty ? 'Feedback/Tip is required!' : null;
                      },
                      onSaved: (String? value) {
                        feedback = value as String;
                      },
                    ),
                    margin: EdgeInsets.all(25.0),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: feedbackButtonClicked,
                      child: Text('Send'),
                    ),
                    margin: EdgeInsets.only(top: 100.0),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            key: formKey,
          ),
          backgroundColor: Theme.of(context).canvasColor),
      onPanUpdate: (gestureDetails) {
        if (gestureDetails.delta.dy > 5) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
