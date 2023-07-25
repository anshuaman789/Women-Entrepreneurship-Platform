import 'package:flutter/material.dart';
import '../explore/market_linkage.dart';
import '../explore/funding.dart';
import '../explore/bds.dart';
import '../explore/M&N.dart';
import '../explore/IApage.dart';
import '../explore/RI.dart';
import '../community/community.dart';

class LandingPage extends StatelessWidget {
  final String userName;

  LandingPage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    ' WEP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              leading: const Icon(Icons.add_circle),
              title: const Text('Explore'),
              children: [
                ExpansionTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text('Interest Areas'),
                  children: [
                    _buildDrawerItem('Funding', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FundingPage()));
                      // Handle submenu 1 tap
                    }),
                    _buildDrawerItem('Incubation and Acceleration', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IApage()));
                      // Handle submenu 2 tap
                    }),
                    _buildDrawerItem('Mentoring and Networking', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MNpage()));
                      // Handle submenu 3 tap
                    }),
                    _buildDrawerItem('Market Linkages', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MarketLinkagePage()));
                      // Handle submenu 4 tap
                    }),
                    _buildDrawerItem('Business Development Services',
                        onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bdsPage()));
                      // Handle submenu 5 tap
                    }),
                    _buildDrawerItem('Research & Innovation', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RIpage()));
                      // Handle submenu 6 tap
                    }),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text('Resource Type'),
                  children: [
                    _buildDrawerItem('Schemes', onTap: () {
                      Navigator.pop(context);
                      // Handle submenu 1 tap
                    }),
                    _buildDrawerItem('Incubators & Accelerators', onTap: () {
                      Navigator.pop(context);
                      // Handle submenu 2 tap
                    }),
                    _buildDrawerItem('Publications & Articles', onTap: () {
                      Navigator.pop(context);
                      // Handle submenu 3 tap
                    }),
                    _buildDrawerItem('Videos', onTap: () {
                      Navigator.pop(context);
                      // Handle submenu 4 tap
                    }),
                    _buildDrawerItem('Toolkits (Coming Soon)', onTap: () {
                      Navigator.pop(context);
                      // Handle submenu 5 tap
                    }),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.group),
              title: const Text('Community'),
              children: [
                ExpansionTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text('Network'),
                  children: [
                    _buildDrawerItem('We Community', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommunityPage()));
                      // Handle submenu 1 tap
                    }),
                    _buildDrawerItem('Mentors (comming soon)', onTap: () {
                      Navigator.pop(context);
                      // Handle submenu 1 tap
                    }),
                    _buildDrawerItem('Stories (comming soon)', onTap: () {
                      Navigator.pop(context);
                      // Handle submenu 1 tap
                    }),
                  ],
                ),
                _buildDrawerItem('Events', onTap: () {
                  Navigator.pop(context);
                  // Handle submenu 2 tap
                }),
              ],
            ),
            _buildDrawerItem('Partners'),
            _buildDrawerItem('About'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Women Entrepreneurship Platform',
              style: TextStyle(fontSize: 34),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Welcome',
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Perform any desired action when the button is pressed
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String text, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(text),
      onTap: onTap,
    );
  }
}
