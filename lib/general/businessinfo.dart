import 'package:flutter/material.dart';

class BusInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Information'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Text(
              'TYPE OF BUSINESS',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1.0,
              height: 20.0,
            ),
            SizedBox(height: 8.0),
            Text('Aspiring Business'),
            SizedBox(height: 10),
            Text(
              'BUSINESS REQUIREMENTS',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1.0,
              height: 20.0,
            ),
            SizedBox(height: 8.0),
            buildInfoRow('Plan to start your own business?:', 'No'),
            buildInfoRow('Do you have a business plan ready:', 'No'),
            buildInfoRow('Do you need a mentor?:', 'No'),
            buildInfoRow('Area of Interest:', 'Entrepreneurship Promotion'),
            SizedBox(height: 10),
            Text(
              'COMPANY LOCATION',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1.0,
              height: 20.0,
            ),
            SizedBox(height: 8.0),
            buildInfoRow('Country:', 'India'),
            buildInfoRow('State/Union Territories:', 'West Bengal'),
            buildInfoRow('City:', 'Calcutta'),
            buildInfoRow('Other City:', 'Agartala'),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
