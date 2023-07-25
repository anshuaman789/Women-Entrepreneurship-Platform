import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  DashboardPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Welcome $username!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Find All Your Tools and Resources In One Place',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16),
            TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'My Feed',
                ),
                Tab(
                  text: 'My Partners',
                ),
                Tab(
                  text: 'Registered Events',
                ),
                Tab(
                  text: 'My Connections',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('My Feed')),
                  Center(child: Text('My Partners')),
                  Center(child: Text('Registered Events')),
                  Center(child: Text('My Connections')),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // Handle initiate smart match button press
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            ),
            child: Text('Initiate Smart Match -->'),
          ),
        ),
      ),
    );
  }
}
