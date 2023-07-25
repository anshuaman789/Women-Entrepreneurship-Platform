import 'package:flutter/material.dart';

class EventScroll extends StatefulWidget {
  @override
  _EventScrollState createState() => _EventScrollState();
}

class _EventScrollState extends State<EventScroll> {
  final List<List<String>> cardTitles = [
    ['WEP 3.0', 'Oct 2022', 'Launch of 6th edition of Women Transforming India(WTI) Awards',
      'Revamped platform with new user interface and functionalities'],

    ['WTI 5th Edition', 'Mar 2022', "On Internaltional Women's Day",
      'WTI awards were conferred on 75 women achievers to celebrate their contribution'],

    ['CISCO-WEP', 'Mar 2021', 'Sattva, deAsra and NASSCOM Foundation onboarded as core partners',
      'Officially onboarded Cisco Systems India as the first CSR / Funding partner.'],

    ['WEP', 'Jan 2021', "On New Year's Day                        .",
      'Revamped community setion with added features including multilingual translation and social logins'],
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollCards(int direction) {
    final currentPosition = _scrollController.offset;
    final cardWidth = 306.0;
    final newPosition = currentPosition + (cardWidth * direction);

    _scrollController.animateTo(
      newPosition,
      duration: Duration(milliseconds: 1000),
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text('Horizontal Scrolling Cards'),
      //   ),
      //   body:
    Container(
          width: 400,
          height: 315,
          //color: Colors.yellow,
          margin: EdgeInsets.only(left:6),
      // decoration: BoxDecoration(
      // color: Colors.white10,
      // borderRadius: BorderRadius.circular(15),
      // ),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      // Scroll to the left
                      scrollCards(-1);
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: Row(
                        children: [
                          for (final row in cardTitles)
                            CardWidget(title: row[0], subtitle: row[1], summary: row[2], details: row[3] ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      // Scroll to the right
                      scrollCards(1);
                    },
                  ),
                ],
              ),
            ],
          ),);
      //);

  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String summary;
  final String details;


  CardWidget({required this.title, required this.subtitle,required this.summary,required this.details});

  @override
  Widget build(BuildContext context) {
    return buildCard(title,subtitle, summary, details);
  }
}

Widget buildCard(String Title, String SubTitle, String Summary, String Details) {
  return Container(
    height: 265,
    width: 305,
   // color: Colors.black54,
    margin: EdgeInsets.only(top: 30,left: 1),
  // decoration: BoxDecoration(
  // color: Colors.orange[50],
  // borderRadius: BorderRadius.circular(15),
  // ),
    child: Card(
      color  : Colors.purple.shade50, //Colors.orange[50], //
      elevation: 8.0,
      margin: EdgeInsets.all(5.0),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
          ListTile(
            leading: Image.asset("assets/images/flower.png"),
            title: Padding( padding: EdgeInsets.only(top: 3),
              child: Text(Title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),),
            subtitle: Text(SubTitle,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            height: 180,
            width: 370,
            //color  : Colors.black12,
            padding: EdgeInsets.only(left: 10, top: 10.0),
            //margin: EdgeInsets.all(16.0),
            child:Column(
              children: <Widget> [
                Padding(padding: EdgeInsets.only(top: 10, left:5, right:10),
                  child: Text(
                    '$Summary',
                    style: TextStyle(fontSize: 18.0, color: Colors.blueGrey,),
                    textAlign: TextAlign.left,
                  ),),
                Padding(padding: EdgeInsets.only(top: 20, left:8, right: 12),
                  child: Text(
                    '$Details',
                    style: TextStyle(fontSize: 20.0, color: Colors.blueGrey,),
                    textAlign: TextAlign.justify,
                  ),),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}