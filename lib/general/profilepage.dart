import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Builder(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Profile Page'),
                  backgroundColor: Colors.purple,
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/Anshu_Aman.jpeg'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Anshu Aman',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Email: anshuaman789@gmail.com',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Phone: 9911122233',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Location: Ranchi, Jharkhand',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.label),
                              SizedBox(width: 5),
                              Text(
                                'Beginner',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              StatCard(title: 'Profile Score', value: '100'),
                              StatCard(title: 'Total Upvotes', value: '50'),
                              StatCard(title: 'Total Badges', value: '5'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Personal(),
                                      ),
                                    );
                                  },
                                  child: Text('Personal Details'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .purple, // Set button color to purple
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BusInfo(),
                                      ),
                                    );
                                  },
                                  child: Text('Business Information'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .purple, // Set button color to purple
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            settings: settings,
          );
        },
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Personal Details'),
          ],
        ),
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

class BusInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Business Information'),
          ],
        ),
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
            buildInfoRow('State/Union Territories:', 'Jharkhand'),
            buildInfoRow('City:', 'Ranchi'),
            buildInfoRow('Other City:', 'Bhagalpur'),
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
