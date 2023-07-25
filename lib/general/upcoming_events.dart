import 'package:flutter/material.dart';
import 'eventDetails.dart';
class UpcomingEventsPage extends StatefulWidget {
  @override
  _UpcomingEventsPageState createState() => _UpcomingEventsPageState();
}

class _UpcomingEventsPageState extends State<UpcomingEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: 2, // Replace with the actual number of events
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventDetails()),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset('assets/images/IndiaTechSummit.jpeg'), // Replace with the actual event image
                  ListTile(
                    title: Text(
                      'India Tech Summit',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Delhi, Delhi | 26 Oct 2023 10:00 AM'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'in English',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          );

        },
      ),
    );
  }
}
