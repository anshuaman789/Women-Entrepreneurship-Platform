import 'package:flutter/material.dart';
import 'upcoming_events.dart';
import 'eventDetails.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  String? dropdownValue;
  String? regionDropdownValue;
  String? industryDropdownValue;
  TextEditingController searchController = TextEditingController();

  void resetForm() {
    setState(() {
      dropdownValue = null;
      regionDropdownValue = null;
      industryDropdownValue = null;
      searchController.clear();
    });
  }

  void navigateToUpcomingEvents() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpcomingEventsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'All government schemes for your entrepreneurial journey.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(color: Colors.purple),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: dropdownValue,
                    decoration: InputDecoration(
                      labelText: 'Choose',
                      labelStyle: TextStyle(color: Colors.purple),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'offline',
                        child: Text('OFFLINE'),
                      ),
                      DropdownMenuItem(
                        value: 'online',
                        child: Text('ONLINE'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: regionDropdownValue,
                    decoration: InputDecoration(
                      labelText: 'Region',
                      labelStyle: TextStyle(color: Colors.purple),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'Assam',
                        child: Text('Assam'),
                      ),
                      DropdownMenuItem(
                        value: 'Maharashtra',
                        child: Text('Maharashtra'),
                      ),
                      DropdownMenuItem(
                        value: 'Kochi',
                        child: Text('Kochi'),
                      ),
                      DropdownMenuItem(
                        value: 'Delhi',
                        child: Text('Delhi'),
                      ),
                      DropdownMenuItem(
                        value: 'Kolkata',
                        child: Text('Kolkata'),
                      ),
                      // Add more city options
                    ],
                    onChanged: (value) {
                      setState(() {
                        regionDropdownValue = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: industryDropdownValue,
                    decoration: InputDecoration(
                      labelText: 'Industry',
                      labelStyle: TextStyle(color: Colors.purple),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'training',
                        child: Text('Training/Skilling'),
                      ),
                      DropdownMenuItem(
                        value: 'startup',
                        child: Text('Starting Up'),
                      ),
                      DropdownMenuItem(
                        value: 'financial_assistance',
                        child: Text('Financial Assistance'),
                      ),
                      DropdownMenuItem(
                        value: 'finance_funding',
                        child: Text('Finance & Funding'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        industryDropdownValue = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle search button click
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        child: Text('SEARCH'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: resetForm,
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        child: Text('RESET'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.purple,
        selectedItemColor: Colors.purple, // Set the unselected item color
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Upcoming Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Past Events',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            navigateToUpcomingEvents();
          }
        },
      ),
    );
  }
}
