import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Educational Qualifications',
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
            buildInfoRow('Qualification:', 'Self-Taught'),
            buildInfoRow('Are you a student:', 'Yes'),
            buildInfoRow('Area of Study:', 'Engineering'),
            buildInfoRow('LinkedIn Profile:', 'null'),
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
