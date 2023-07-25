import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:wep_project/common/variables.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './methodsfile.dart';
import '../feedback/feedback.dart';

//Heading("About Us", Colors.blueGrey, 36.0, FontWeight.bold),

Widget IconRow(BuildContext ctx, String image1, String image2, String image3) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(5),
            child: Image.asset(image1, height: 90, width: 90)),
        Padding(
          padding: EdgeInsets.all(5),
          child: Image.asset(image2, height: 90, width: 90),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Image.asset(image3, height: 90, width: 90),
        ),
      ]);
}

Widget CreditText(BuildContext ctx, String linesub, String line) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    SizedBox(width: 12),
    Icon(
      Icons.circle,
      size: 10,
    ),
    SizedBox(width: 12),
    if (!(linesub == null || linesub.isEmpty))
      Container(
        width: 70,
        child: Text(
          linesub,
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Arial'),
        ),
      ),
    Container(
      margin: EdgeInsets.only(left: 10),
      width: 270,
      child: Text(
        line,
        softWrap: true,
        maxLines: 8,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
      ),
    ),
  ]);
}

Widget TextPlain(BuildContext ctx, bool bold, int width, String line) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    Container(
      margin: EdgeInsets.only(left: 10),
      width: 375,
      child: Text(
        line,
        softWrap: true,
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
            fontSize: 18.0),
      ),
    ),
  ]);
}

Widget Footer(BuildContext ctx, IconData icon1, IconData icon2, IconData icon3,
    IconData icon4, Widget wgt1, Widget wgt2, Widget wgt3, Widget wgt4) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        icon: Icon(icon1),
        onPressed: () {
          callClass(ctx, wgt1);
        },
      ),
      IconButton(
        icon: Icon(icon2),
        onPressed: () {
          callClass(ctx, wgt2);
        },
      ),
      IconButton(
        icon: Icon(icon3),
        onPressed: () {
          callClass(ctx, wgt3);
        },
      ),
      IconButton(
        icon: Icon(icon4),
        onPressed: () {
          callClass(ctx, wgt4);
        },
      ),
    ],
  );
}

Widget Heading2(String heading, Color colors, double size,
    FontWeight fontweight, Alignment alg) {
  return Container(
    color: Colors.orange,
    width: 295,
    height: 60,
    margin: EdgeInsets.only(bottom: 55),
    child: Align(
      alignment: alg,
      child: Text(
        heading,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: colors,
          fontSize: size,
          fontWeight: fontweight,
        ),
      ),
    ),
  );
}

Widget Heading(
    String heading, Color colors, double size, FontWeight fontweight) {
  return Padding(
    // Can be Grouped as Heading
    padding: EdgeInsets.only(top: 10.0, left: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        heading,
        style: TextStyle(
          color: colors,
          fontSize: size,
          fontWeight: fontweight,
        ),
      ),
    ),
  );
}

Widget BulletPointTextButton(String text, IconData bulletIcon) {
  return Padding(
    padding: EdgeInsets.only(left: 28.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          bulletIcon,
          size: 10,
        ),
        SizedBox(width: 8),
        TextButton(
          onPressed: () {
            // Add your button action here
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildListItem(String text, Icon icon, {VoidCallback? onTapFunc}) {
  return ListTile(
    leading: icon,
    title: buildCaption(text),
    onTap: onTapFunc,
  );
}

Widget buildSubListItem(String text, Icon icon, {VoidCallback? onTapFunc}) {
  return ListTile(
    leading: icon,
    title: buildSubCaption(text),
    onTap: onTapFunc,
  );
}

Widget buildCaption(String text) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 16.0, fontFamily: 'Arial', fontWeight: FontWeight.bold),
  );
}

Widget buildSubCaption(String text) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Arial',
        fontWeight: FontWeight.bold,
        color: subListTextColor),
  );
}

Widget buildSocialConnection(
    String text, String url, Color iconColor, IconData icon) {
  return Container(
    height: 40.0,
    margin: EdgeInsets.only(top: 10.0, left: 8),
    child: TextButton.icon(
      onPressed: () {
        launchUrlString(url);
      },
      icon: Icon(
        icon,
        color: iconColor,
        size: 25,
      ),
      label: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: Colors.blueAccent),
        ),
      ),
    ),
  );
}

Widget buildParagraph(
    double height, double width, String text, int lines, double fontsize) {
  return Container(
    height: height,
    width: width,
    margin: EdgeInsets.only(left: 15, top: 20),
    child: Padding(
      padding: EdgeInsets.only(top: 1),
      child: Text(
        text,
        softWrap: true,
        // Enable or disable soft wrapping
        overflow: TextOverflow.fade,
        // Specify the overflow behavior
        maxLines: lines,
        // Set the maximum number of lines
        textScaleFactor: 1.3,
        // Scale the text size
        strutStyle: StrutStyle(height: 1.5),
        // Adjust the line height
        style: TextStyle(
          fontSize: fontsize,
          fontFamily: 'Arial',
        ),
      ),
    ),
  );
}
