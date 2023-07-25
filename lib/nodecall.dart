import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Define the API endpoint URL
  var url = Uri.parse('http://192.168.1.2:3001/');

  // Sample parameter
  var parameter = 'Hello, World!';

  // Create a map with the parameter
  var requestData = {
    'parameter': parameter,
  };

  // Convert the request data to JSON
  var jsonRequestData = jsonEncode(requestData);

  // Set the headers
  var headers = {
    'Content-Type': 'application/json',
  };

  // Make a POST request to the API with the JSON payload and headers
  var response = await http.post(
    url,
    headers: headers,
    body: jsonRequestData,
  );

  // Check the response status code
  if (response.statusCode == 200) {
    // Parse the response JSON
    var responseData = jsonDecode(response.body);

    // Extract the result from the response
    var result = responseData['result'];

    // Print the result
    print('Result: $result');

    // You can further utilize the result as needed
    // For example, display it in your Flutter UI or perform additional computations
  } else {
    print('Error: ${response.body}');
  }
}
