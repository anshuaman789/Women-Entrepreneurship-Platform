import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wep_project/community/community.dart';
import 'package:wep_project/general/profilepage.dart';
import 'package:wep_project/home/afhome.dart';

import './eventscroll.dart';
import 'common/widgetslib.dart';
import 'partners/partneradd.dart';
import './feedback/feedback.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Heading("About Us", Colors.blueGrey, 36.0, FontWeight.bold),
                  Container(
                    // Main for Intro
                    height: 290.0,
                    width: 450.0,
                    color: Colors.indigo[200],
                    // Colors.pink[50],  //Colors.purple[50],
                    padding: EdgeInsets.only(
                        top: 20.0, left: 1.0, right: 1.0, bottom: 1.0),
                    margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 1),
                          height: 280.0,
                          width: 220.0,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 200.0,
                                width: 200.0,
                                padding: EdgeInsets.only(right: 1),
                                child: Text(
                                  """"WEP welcomes the call for action given by Hon'ble PM towards a more sustainable way of life. WEP would undertake a series of initiatives to encourage and highlight women empowering Life""",
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Container(
                                height: 25.0,
                                width: 200.0,
                                padding: EdgeInsets.only(right: 1),
                                child: Text(
                                  "Ms. Anna Roy",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                // Text
                                height: 25.0,
                                width: 200.0,

                                padding: EdgeInsets.only(right: 1),
                                child: Text(
                                  "Mission Director, WEP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 165,
                          // Specify the desired width of the container
                          height: 200,
                          // Specify the desired height of the container

                          margin: EdgeInsets.only(left: 10, bottom: 50),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 1.0, // Border width
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/about_missiondirector.png'),
                              // Replace with your image asset path
                              fit: BoxFit
                                  .cover, // Fill the container with the image, maintaining aspect ratio
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.pink[300],
                    padding: EdgeInsets.only(
                        top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                    margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Text(
                      'Our Journey',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    // color: Colors.pink[300],
                    padding: EdgeInsets.only(
                        top: 1.0, left: 6.0, right: 6.0, bottom: 6.0),
                    margin: EdgeInsets.only(top: 1, left: 10, right: 10),
                    child: Text(
                        'The Women Entrepreneurship Platform (WEP) is a first of its kind, unified access portal which brings together women from different parts of India to build a nurturing ecosystem that enables them to realize their entrepreneurial aspirations. WEP achieves this by facilitating relevant information and services through key partnerships.',
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.justify),
                  ),
                  Container(
                    //  height: 190,
                    child: EventScroll(),
                  ),
                  Container(
                    // Yellow box
                    height: 260.0,
                    width: 450.0,
                    color: Colors.orange[300],
                    padding: EdgeInsets.only(
                        top: 10.0, left: 1.0, right: 1.0, bottom: 1.0),
                    margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                      child: Text(
                        'As an enabling platform, WEP is built on three pillars',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  Container(
                    // Yellow box
                    height: 750.0,
                    width: 450.0,
                    color: Colors.purple[50],
                    //.orange[50],
                    padding: EdgeInsets.only(
                        top: 20.0, left: 1.0, right: 1.0, bottom: 1.0),
                    margin: EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
                    child: Container(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                        child: Column(children: <Widget>[
                          Text('\n01',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.orange[400],
                                fontWeight: FontWeight.bold,
                              )),
                          Text('\n Iccha Shakti',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              )),
                          Container(
                              height: 120.0,
                              width: 320.0,
                              padding: EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              child: Text(
                                'Represents motivating aspiring entrepreneurs to start their business',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.justify,
                              )),
                          Text('\n02',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.orange[400],
                                fontWeight: FontWeight.bold,
                              )),
                          Text('\n Gyaan Shakti',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              )),
                          Container(
                              height: 120.0,
                              width: 320.0,
                              padding: EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              child: Text(
                                'Represents providing knowledge and ecosystem support to women entrepreneurs to foster entrepreneurship\n',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.justify,
                              )),
                          Text('\n03',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.orange[400],
                                fontWeight: FontWeight.bold,
                              )),
                          Text('\n Karma Shakti',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              )),
                          Container(
                              height: 120.0,
                              width: 320.0,
                              padding: EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              child: Text(
                                'Represents providing hands-on support to entrepreneurs in setting and scaling up businesses',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.justify,
                              )),
                        ])),
                  ),
                  Container(
                    // color: Colors.pink[300],
                    padding: EdgeInsets.only(
                        top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                    margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Text(
                      'What we have to offer',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    // color: Colors.pink[300],
                    padding: EdgeInsets.only(
                        top: 1.0, left: 6.0, right: 6.0, bottom: 6.0),
                    margin: EdgeInsets.only(top: 1, left: 10, right: 10),
                    child: Text(
                        'As an aggregator platform, WEP hosts information and services relevant to women entrepreneurs. WEP enables key partnerships to bring crucial content, workshops, campaigns and other avenues of learning and growth to its users from trailblazers in the industry. Through its partnerships, services are provided in 6 main focus areas\n',
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.justify),
                  ),
                  Container(
                      child: Column(children: <Widget>[
                    BulletPointTextButton("Funding", Icons.circle),
                    BulletPointTextButton(
                        "Incubation and Acceleration", Icons.circle),
                    BulletPointTextButton(
                        "Mentoring and Networking", Icons.circle),
                    BulletPointTextButton("Market Linkages", Icons.circle),
                    BulletPointTextButton(
                        "Business Development Services", Icons.circle),
                    BulletPointTextButton(
                        "Resarch and Innovation", Icons.circle),
                  ])),
                  Container(
                    // color: Colors.pink[300],
                    padding: EdgeInsets.only(
                        top: 1.0, left: 6.0, right: 6.0, bottom: 6.0),
                    margin: EdgeInsets.only(top: 1, left: 10, right: 10),
                    child: Text(
                        '\nFor this, WEP encourages entrepreneurs to share their entrepreneurial journeys, stories & experiences to nurture peer learning. All of this is further strengthened by the mentorship of industry players.\n'
                        '\nWEP platform, as a driver of change, will also promote offline initiatives and outreach programmes to promote the entrepreneurial spirit among potential women entrepreneurs, in collaboration with partner organizations.\n',
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.justify),
                  ),
                ],
              )),
              ///////////////////////////////////////////////////////////////////////////////////////
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.purple[50],
              child: Footer(
                  context,
                  Icons.home,
                  Icons.explore,
                  Icons.abc,
                  Icons.person,
                  AFHomePage(),
                  CommunityPage(),
                  Feedbacks(),
                  ProfilePage()),
            ),
          ),
        ],
      ),

      ///////////////////////////////////////////////////////////////////////////////////////
      // ],
      // ),
      // ),
    );
  }
}
