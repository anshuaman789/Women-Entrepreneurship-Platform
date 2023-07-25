import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  search('I want IT help');
}

void search(String query) async {
  final url = Uri.parse('http://192.168.43.228:5000/search');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'query': query});

  // final response = await http.post(url, headers: headers, body: body);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    // Process the response here
    print(response.body.length);
    final longString = jsonResponse.toString(); // Your long string
    final maxLength = 100; // Maximum length for each printed line

    for (var i = 0; i < longString.length; i += maxLength) {
      final substring = longString.substring(i, i + maxLength);
      print(substring);
      print("******************************************************8");
    }
//    print(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}
