import 'package:flutter/material.dart';

import '../feedback/feedback.dart';
import '../common/widgetslib.dart';
import '../common/variables.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits'),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Heading("Credits", Colors.blueGrey, 36.0, FontWeight.bold),
                      SizedBox(height: 12,),
                      TextPlain(context, !boldText, 375, "This application was developed using the following software:"),
                      SizedBox(height: 12,),
                      CreditText(context, "Flutter".padRight(4), "Flutter is an open-source UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase."),
                      SizedBox(height: 12,),
                      CreditText(context, "URL\nLauncher",
"A Flutter plugin that provides a simple way to open URLs in the device's default browser."),
                      SizedBox(height: 12,),
                      CreditText(context, "HTTP",
                          "A package for making HTTP requests and handling responses in Flutter apps."),
                      SizedBox(height: 12,),
                      CreditText(context, "Font\nAwesome",
                          "A package that allows you to use Font Awesome icons in your Flutter app."),
                      SizedBox(height: 12,),
                      CreditText(context, "flutter\nmap",
                          "A Flutter package that provides interactive and customizable maps."),
                      SizedBox(height: 12,),

                      CreditText(context, "latlong2",
                          "A Flutter package that provides utilities for working with latitude and longitude coordinates."),
                      SizedBox(height: 12,),

                      CreditText(context, "path",
                          "A package that provides utilities for working with file and directory paths in Flutter apps."),
                      SizedBox(height: 12,),

                      CreditText(context, "dots\nindicator",
                          "A package that provides a customizable indicator for paginated views in Flutter apps."),
                      SizedBox(height: 12,),

                      CreditText(context, "flutter\ncustom\nclippers",
                          "The flutter_custom_clippers module is a Flutter package that provides a collection of customizable clipper shapes for creating visually appealing custom shapes in Flutter applications."),
                      SizedBox(height: 12,),

                      CreditText(context, "MySql",
                          "An open-source relational database management system used for storing and retrieving app data."),
                      SizedBox(height: 12,),

                      CreditText(context, "Node.js",
                          "A JavaScript runtime environment that allows server-side execution of JavaScript code."),
                      SizedBox(height: 12,),

                      CreditText(context, "Express.js",
                          "a fast, unopinionated, and minimalist web framework for Node.js."),
                      SizedBox(height: 12,),
                      CreditText(context, "Python",
                          "A versatile programming language used for various purposes, including backend development."),
                      SizedBox(height: 12,),
                      CreditText(context, "scikit-learn\n(ML)",
                          "a versatile ML library for Python."),
                      SizedBox(height: 12,),
                      CreditText(context, "SentenceTransformer",
                          "a Python NLP framework for state-of-the-art sentence embeddings."),
                      SizedBox(height: 12,),
                      CreditText(context, "Express.js",
                          "a fast, unopinionated, and minimalist web framework for Node.js. "),
                      SizedBox(height: 12,),

                      TextPlain(context, !boldText, 375, "We would like to express our gratitude to the creators and contributors of these software and libraries for their valuable work and contributions to the development community."),
                      SizedBox(height: 22,),

                      TextPlain(context, boldText, 375, "Trademarks:"),
                      SizedBox(height: 12,),

                      CreditText(context, "", "Flutter and the Flutter logo are trademarks of Google LLC."),
                      SizedBox(height: 12,),

                      CreditText(context, "", "MySQL is a registered trademark of Oracle Corporation."),
                      SizedBox(height: 12,),

                      CreditText(context, "", "Font Awesome is a registered trademark of Fonticons, Inc."),
                      SizedBox(height: 12,),

                      CreditText(context, "", "The names and logos of other third-party software modules mentioned above are the trademarks or registered trademarks of their respective owners."),
                      SizedBox(height: 12,),

                      TextPlain(context, !boldText, 375, "We acknowledge and respect the trademarks and intellectual property rights of these companies and organizations."),
                      SizedBox(height: 12,),

                    ],

                  )
              ),
              ///////////////////////////////////////////////////////////////////////////////////////
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.purple[50],
              child: Footer(context, Icons.home, Icons.explore, Icons.abc, Icons.person, Feedbacks(), Feedbacks(), Feedbacks(), Feedbacks()),
            ),
          ),
        ],
      ),

      ///////////////////////////////////////////////////////////////////////////////////////
      // ],
      // ),
      // ),
    );
  }
}

