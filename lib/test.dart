import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  final apiURL = 'http://192.168.1.2:5000/search'; // Replace with the actual API URL
  final apiKey = 'n5vK9SH78sC2WZy6aDh1XNrLOtcIM4z3EGxweFmjdTlkqR0pgPQUJoAiBfYbVsu'; // Replace with your API key

  // Prepare the request body
  final requestBody = {
    'search': '',
    'state': '',
    'sector': '',
  };

  // Set the API key in the headers
  final headers = {'Content-Type': 'application/json',
                   'API-Key': apiKey};

  // Send a POST request to the API
  http.post(Uri.parse(apiURL), headers: headers, body: json.encode(requestBody))
      .then((response) {
    if (response.statusCode == 200) {
      // Successful response
      final responseData = json.decode(response.body);
      print(responseData);
    } else {
      // Error occurred
      print('Error: ${response.statusCode}');
    }
  }).catchError((error) {
    print('Error: $error');
  });
}
