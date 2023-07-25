import 'package:wep_project/common/methodsfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

import '../common/widgetslib.dart';
import '../community/community.dart';
import '../general/profilepage.dart';
import '../home/afhome.dart';

class Feedbacks extends StatefulWidget {
  @override
  FeedbacksState createState() => FeedbacksState();
}

class FeedbacksState extends State<Feedbacks> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackeTextController = TextEditingController();
  String _responseMessage = '';

  Future<void> _submitForm() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final url = Uri.parse('http://your-api-endpoint.com/submit');
      final response = await http.post(url, body: {
        'name': _nameController.text,
        'email': _emailController.text,
        'feedback': _feedbackeTextController.text,
      });

      if (response.statusCode == 200) {
        setState(() {
          _responseMessage = 'Feedback submitted successfully';
        });
      } else {
        setState(() {
          _responseMessage =
              'Failed to submit feedback. Please try later. Error ID: ${response..statusCode}';
        });
      }
    }
  } //Submit form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align Column Content Left
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 16.0, bottom: 16.0, right: 16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align Column Content Left

                          children: [
                            Heading("Feedback", Colors.blueGrey, 36.0,
                                FontWeight.bold),
                            SizedBox(height: 16.0),
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: TextFormField(
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                  ),
                                  hintText: 'Please Enter Your Name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (value != null &&
                                          !validateText(
                                            value,
                                            5,
                                          ))) {
                                    return "Enter Valid Name";
                                  } else {
                                    return null;
                                  }
                                },
                                onFieldSubmitted: (value) {
                                  _formKey.currentState!.validate();
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ), //Name
                            SizedBox(height: 16.0),
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                  ),
                                  hintText: 'Please Enter Your EmailID',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (value != null &&
                                          !validateEmail(value))) {
                                    return "Enter Valid Email";
                                  } else {
                                    return null;
                                  }
                                },
                                onFieldSubmitted: (value) {
                                  _formKey.currentState!.validate();
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ), //Email
                            SizedBox(height: 16.0),
                            Container(
                              padding: EdgeInsets.only(left: 14),
                              //height: 250.0, // Set the desired height
                              width: double.infinity, // Set the desired width
                              child: TextFormField(
                                controller: _feedbackeTextController,
                                maxLines: 10,
                                textInputAction: TextInputAction.newline,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                  ),
                                  hintText: 'Please Enter Your Feedback',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (value != null &&
                                          !validateText(value, 20))) {
                                    return "Enter Valid Feedback";
                                  } else {
                                    return null;
                                  }
                                },
                                onFieldSubmitted: (value) {
                                  _formKey.currentState!.validate();
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            SizedBox(height: 6.0),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.indigo.shade300),
                                          minimumSize:
                                              MaterialStateProperty.all<Size>(
                                                  Size(100.0, 40.0)),
                                        ),
                                        onPressed: _submitForm,
                                        child: Text('Submit'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.indigo.shade300),
                                          minimumSize:
                                              MaterialStateProperty.all<Size>(
                                                  Size(100.0, 40.0)),
                                        ),
                                        onPressed: () {
                                          callPath(context, '/mapaddress');
                                        },
                                        child: Text('View Map'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(_responseMessage),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ///////////////////////////////////////////////////////////////
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.purple[50],
              child: Footer(
                  context,
                  Icons.home,
                  Icons.explore,
                  Icons.abc,
                  Icons.person,
                  AFHomePage(),
                  CommunityPage(),
                  Feedbacks(),
                  ProfilePage()),
            ),
          ),
          ///////////////////////////////////////////////////////////////
        ],
      ),
    );
  }
}
