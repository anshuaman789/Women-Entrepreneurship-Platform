import 'dart:typed_data';

import 'package:wep_project/common/methodsfile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../common/variables.dart';
import './partnerdetails.dart';

class MyCard extends StatelessWidget {
  // final ImageProvider image;
  final String orgintro;
  final String orgaddress;
  final String vertical;
  final String company;
  final String website;
  final String name;
  final String tel;
  final String email;
  final String category;
  final Uint8List imageData;

  double calculateWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width + 20; // Add padding for the container
  }

  MyCard({
    required this.orgintro,
    required this.orgaddress,
    required this.vertical,
    required this.company,
    required this.website,
    required this.name,
    required this.tel,
    required this.email,
    required this.category,
    required this.imageData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12 * hF, left: 7 * wF, right: 7 * wF),
      color: Colors.purple[50],
      elevation: 8.0,
      child: Container(
        // Main Card
//color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 5 * wF),
        height: 280 * hF,
        width: 350 * wF,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: <Widget>[
                  //Image and Name/Website
                  Container(
                    // Company Logo Image
                    child: Padding(
                      padding: EdgeInsets.all(0.1),
                      child: Image(
                        image: MemoryImage(imageData),
                        width: 60 * wF,
                        height: 80 * hF,
                      ),
                    ),
                  ), // Company Logo Image
                  Container(
                    // Name & Website
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          // Company
                          padding: EdgeInsets.only(left: 5 * wF, top: 5 * hF),
                          child: Container(
                            width: 230 * wF,
                            child: TextButton(
                              onPressed: () {
                                callClass(
                                    context,
                                    PartnerDetails(
                                      company: this.company,
                                      website: this.website,
                                      name: this.name,
                                      phone: this.tel,
                                      email: this.email,
                                      address: [this.orgaddress],
                                      intro: this.orgintro,
                                      Services: [
                                        this.category,
                                        this.vertical,
                                        this.orgintro
                                      ],
                                      imageData: this.imageData,
                                    ));
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  this.company, //item.website),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16 * wF,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo),
                                ),
                              ),
                            ),
                          ),
                        ), // Company
                        //       Container(
                        //         height: 35,
                        //         color: Colors.red,
                        Padding(
                          padding: EdgeInsets.only(left: 5 * wF),
                          child: TextButton(
                            onPressed: () {
                              launchUrlString(this.website);
                            },
                            child: Container(
                              width: 200,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  this.website,
                                  //item.website),
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo),
                                ),
                              ),
                            ),
                          ),
                        ), //),
                      ],
                    ),
                  ),
                ],
              ),
            ), //Header Image Name Website

            Padding(
              padding: EdgeInsets.all(1),
              child: Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 1, left: 10),
              child: Text(name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.phone), // Replace with your desired icon
                  SizedBox(
                    width: 8.0,
                  ), // Add spacing between the icon and text
                  Container(
                    width: 290 * wF,
                    child: TextButton(
                      onPressed: () {
                        launchPhone(this.tel);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            this.tel, //item.website),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.email), // Replace with your desired icon
                  SizedBox(
                    width: 8.0,
                  ), // Add spacing between the icon and text
                  Container(
                    width: 290 * 320 / 411,
                    child: TextButton(
                      onPressed: () {
                        launchEmail(this.email);
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            this.email, //item.website),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: calculateWidth(this.category),
              height: 35 * hF,
              //  alignment: Alignment.center,
              //     margin: EdgeInsets.only(left: 10),
              //       padding: EdgeInsets.only(top: 0.0, left: 5),
              decoration: BoxDecoration(
                color: Colors.blue[200], // Background color of the text box
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  this.category.trim(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ), //),
          ], // Elements in Cards Main Column Array
        ), // Main
      ),
    );
  }
}
