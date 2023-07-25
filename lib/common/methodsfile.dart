import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/services.dart';

// Future<String> imageAssetToBase64(String imagePath) async {
//   Completer<String> completer = Completer<String>();
//
//   try {
//     ByteData byteData = await rootBundle.load(imagePath);
//     Uint8List imageBytes = byteData.buffer.asUint8List();
//     String base64Encoded = base64Encode(imageBytes);
//     completer.complete(base64Encoded);
//   } catch (e) {
//     completer.completeError(e);
//   }
//
//   return completer.future;
// }

import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/services.dart';

// String imageAssetToBase64(String imagePath) {
//   ByteData byteData = rootBundle.lloadSync(imagePath);
//   Uint8List imageBytes = byteData.buffer.asUint8List();
//   String base64Encoded = base64.encode(imageBytes);
//   return base64Encoded;
// }

String stripHtmlTags(String html) {
  if (html == null) {
    return '';
  }

  RegExp exp = RegExp(r'<\/?(\w+)[^>]*>', multiLine: true, caseSensitive: true);
  return html.replaceAllMapped(exp, (match) {
    String? tag = match.group(1);
    if (tag == 'li') {
      return '* ';
    }
    return '';
  });
}
String imageAssetToBase64(String imagePath) {
  File imageFile = File(imagePath);
  List<int> imageBytes = imageFile.readAsBytesSync();
  String base64Encoded = base64Encode(imageBytes);
  return base64Encoded;
}

// String imageAssetToBase64(String imagePath) {
//   ByteData byteData = rootBundle.loadSync(imagePath);
//   List<int> imageData = byteData.buffer.asUint8List();
//   String base64Encoded = base64Encode(imageData);
//   return base64Encoded;
// }

callClass(BuildContext ctx, Widget wgt)
{
  Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => wgt));
  }

callPath(BuildContext context,
    String path) // Separated from Class as it can be used anywhere
{
  Navigator.pop(context);
  Navigator.pushNamed(context, path);
}

void launchPhone(String phoneNumber) async {
  try {
    final Uri params = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch phone app';
    }
  } catch (e) {
    throw 'Error launching phone app: $e';
  }
}

bool validateEmail(String email) {
  // Regular expression pattern for email validation
  final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

  if (email.isEmpty) {
    // Email is empty
    return false;
  } else if (!emailRegex.hasMatch(email)) {
    // Email format is invalid
    return false;
  }

  return true;
}

void launchEmail(String emailAddress) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: emailAddress,
  );
  try {
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch email.';
    }
  } catch (e) {
    throw 'Error launching Email: $e';
  }
}

bool validateText(String name, int len) {
  if (name == null || name.isEmpty || name.length < len) {
    return false;
  }
  return true;
}
