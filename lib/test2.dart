import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paginated Lorem Ipsum',
      home: PaginatedLoremIpsum(),
    );
  }
}

class PaginatedLoremIpsum extends StatefulWidget {
  @override
  _PaginatedLoremIpsumState createState() => _PaginatedLoremIpsumState();
}

class _PaginatedLoremIpsumState extends State<PaginatedLoremIpsum> {
  final url = Uri.parse('http://192.168.1.2:5000/api/data');
  List<String> paginatedData = [];
  int currentPage = 1;
  int totalPages = 1;
  final pageSize = 10;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final requestBody = jsonEncode({'page': currentPage, 'page_size': pageSize});
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: requestBody,
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      paginatedData = List<String>.from(responseData['data']);
      totalPages = responseData['total_pages'];
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    setState(() {}); // Refresh the UI after data is loaded
  }

  void loadNextPage() {
    if (currentPage < totalPages) {
      currentPage++;
      loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paginated Lorem Ipsum'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Page: $currentPage / Total Pages: $totalPages',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: paginatedData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(paginatedData[index]),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loadNextPage,
              child: Text('Load Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
