import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wep_project/community/community.dart';
import 'package:wep_project/explore/IApage.dart';
import 'package:wep_project/explore/M&N.dart';
import 'package:wep_project/explore/RI.dart';
import 'package:wep_project/explore/bds.dart';
import 'package:wep_project/explore/funding.dart';
import 'package:wep_project/explore/market_linkage.dart';
import 'dart:ui' as ui;

import '../general/login.dart';
import '../general/profilepage.dart';
import '../general/registration.dart';
import '../common/widgetslib.dart';
import '../common/methodsfile.dart';
import '../common/variables.dart';
import '../aboutus.dart';
import 'WEPVideo.dart';
import '../partners/partners.dart';
import '../feedback/feedback.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  bool _loggedIn =
      false; // Variable to be set when user logs in successfully.  Must be in stateful class.
  // var hF = 0.0;  // Height Factor
  // var wF = 0.0;  // Width Factor

  Future<double> height() async {
    // Perform your asynchronous operations here
    await Future.delayed(const Duration(seconds: 2)); // Example delay
    return 1.0;
    // return MediaQuery
    //     .of(context)
    //     .size
    //     .height / 890.28571429;
  }

  Future<double> width() async {
    // Perform your asynchronous operations here
    await Future.delayed(const Duration(seconds: 2)); // Example delay
    return 1.0;
    // return MediaQuery
    //     .of(context)
    //     .size
    //     .width / 411.42857143;
  }

  @override
  void initState() {
    super.initState();

    width().then((value) {
      setState(() {
        wF = value;
      });
    });

    width().then((value) {
      setState(() {
        hF = value;
      });
    });
    // Apply both whereever size it set. Font may utilize widthFactor to reszie.
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //     Expanded(
              //
              //         child: Align(
              //             alignment: Alignment.centerLeft,
              //             child: Text('WEP'),
              // ),
              //     ),
              Container(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    homeLogo,
                    height: 40,
                  ),
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.notification_important),
                ),
              ),
              //
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 108,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: drawerColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      drawerLogo,
                      width: 50,
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Women \nEntrepreneurship \nPlatform',
                        style: TextStyle(
                          color: drawerTitleColor, // To blend color with Logo
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ExpansionTile(
              // collapsedTextColor: Colors.black,
              // collapsedIconColor: Colors.black,
              leading: const Icon(
                  Icons.account_box_outlined), //, color: Colors.purple
              title: buildCaption('Account'),
              subtitle: const Text(
                'Login or Signup',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                buildSubListItem(
                  'Login',
                  Icon(Icons.login, color: subIconColor),
                  onTapFunc: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ); // Implement your path
                  },
                ),
                buildSubListItem(
                  'Signup',
                  Icon(Icons.person_add, color: subIconColor),
                  onTapFunc: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()),
                    ); // Implement your path
                  },
                ),
              ], // Partners
            ),
            ExpansionTile(
              leading: const Icon(Icons.travel_explore),
              title: buildCaption('Explore'),
              subtitle: const Text('Interests and Resources',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ExpansionTile(
                  leading: const Icon(Icons.interests),
                  title: buildCaption('Interest Areas'),
                  subtitle: const Text('Entrepreneurs\' Interests',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  children: [
                    buildSubListItem(
                      'Funding',
                      Icon(Icons.account_balance, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FundingPage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Mentoring & Networking',
                      Icon(Icons.account_tree, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MNpage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Business Development Services',
                      Icon(Icons.store, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => bdsPage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Incubation & Acceleration',
                      Icon(Icons.speed, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IApage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Market Linkages',
                      Icon(Icons.link, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MarketLinkagePage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Research & Innovation',
                      Icon(Icons.manage_search, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RIpage()),
                        ); // Implement your path
                      },
                    ),
                  ], // Explore->Interest Areas
                ),
                ExpansionTile(
                  leading: const Icon(Icons.menu_book),
                  title: buildCaption('Resource Type'),
                  subtitle: const Text('Entrepreneurs\' Resources',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  children: [
                    ///////////////////////////////////////////////////////////////
                    buildSubListItem(
                      'Schemes',
                      Icon(Icons.assignment, color: subIconColor),
                      onTapFunc: () {
                        callPath(context, '/'); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Incubaors & Accelerators',
                      Icon(Icons.speed, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IApage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Publications & Articles',
                      Icon(Icons.article, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Videos',
                      Icon(Icons.video_library, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Toolkits(Coming Soon)',
                      Icon(Icons.handyman, color: subIconColor),
                      onTapFunc: () {
                        callPath(context, '/'); // Implement your path
                      },
                    ),
                  ], // Explore->Resource Type
                )
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.group),
              title: buildCaption('Community'),
              subtitle: const Text('Network and Events',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ExpansionTile(
                  leading: const Icon(Icons.account_tree),
                  title: buildCaption('Network'),
                  subtitle: const Text('Networking Resources',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  children: [
                    buildSubListItem(
                      'We Community',
                      Icon(Icons.people, color: subIconColor),
                      onTapFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        ); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Mentors (Coming Soon)',
                      Icon(Icons.person_pin, color: subIconColor),
                      onTapFunc: () {
                        callPath(context, '/'); // Implement your path
                      },
                    ),
                    buildSubListItem(
                      'Stories (Coming Soon)',
                      Icon(Icons.flutter_dash, color: subIconColor),
                      onTapFunc: () {
                        callPath(context, '/'); // Implement your path
                      },
                    ),
                  ],
                ),
                buildSubListItem(
                  'Recent Events',
                  Icon(Icons.event, color: subIconColor),
                  onTapFunc: () {
                    callPath(context, '/'); // Implement your path
                  },
                ),
              ], // Community
            ),
            ExpansionTile(
              // collapsedTextColor: Colors.black,
              // collapsedIconColor: Colors.black,
              leading: const Icon(
                  FontAwesomeIcons.handshake), //, color: Colors.purple
              title: buildCaption('Partners'),
              subtitle: const Text(
                'WEP Partner Collaboraters',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                buildSubListItem(
                  'Look for Partners',
                  Icon(Icons.looks, color: subIconColor),
                  onTapFunc: () {
                    callPath(context, '/partners'); // Implement your path
                  },
                ),
                buildSubListItem(
                  'Apply for Partnership',
                  Icon(Icons.assignment_outlined, color: subIconColor),
                  onTapFunc: () {
                    callPath(context, '/partnersadd'); // Implement your path
                  },
                ),
              ], // Partners
            ),
            buildListItem(
              'Smart Match',
              const Icon(FontAwesomeIcons.equals),
              onTapFunc: () {
                callPath(context, '/'); // Implement your path
              },
            ),
            ExpansionTile(
              // collapsedTextColor: Colors.black,
              // collapsedIconColor: Colors.black,
              leading: const Icon(
                  FontAwesomeIcons.ellipsisVertical), //, color: Colors.purple
              title: buildCaption('Immerse More'),
              subtitle: const Text(
                'FAQs, Connect & More',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                buildSubListItem(
                  'FAQs',
                  Icon(Icons.question_answer, color: subIconColor),
                  onTapFunc: () {
                    callPath(context, '/faq'); // Implement your path
                  },
                ),
                ExpansionTile(
                  // collapsedTextColor: Colors.black,
                  // collapsedIconColor: Colors.black,
                  leading: const Icon(Icons.insights), //, color: Colors.purple
                  title: buildCaption('Indulge'),
                  subtitle: const Text(
                    'Connect and Join Events',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    buildSubListItem(
                      'Connect',
                      Icon(Icons.favorite, color: subIconColor),
                      onTapFunc: () {
                        callPath(context, '/connect'); // Implement your path
                      },
                    ),
                    // buildSubListItem(
                    //   'Newsletter',
                    //   Icon(Icons.new_releases, color: subIconColor),
                    //   onTapFunc: () {
                    //     callPath(context, '/'); // Implement your path
                    //   },
                    // ),
                    buildSubListItem(
                      'Events',
                      Icon(Icons.event, color: subIconColor),
                      onTapFunc: () {
                        callPath(context, '/events'); // Implement your path
                      },
                    ),
                  ], // MORE
                ),
              ],
            ),
            ExpansionTile(
              // collapsedTextColor: Colors.black,
              // collapsedIconColor: Colors.black,
              leading: const Icon(Icons.info), //, color: Colors.purple
              title: buildCaption('About'),
              subtitle: const Text(
                'WEP and Credits',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                buildSubListItem(
                  'About Us',
                  Icon(Icons.info_outline, color: subIconColor),
                  onTapFunc: () {
                    callPath(context, '/aboutus'); // Implement your path
                  },
                ),
                buildSubListItem(
                  'Credits',
                  Icon(Icons.credit_card, color: subIconColor),
                  onTapFunc: () {
                    callPath(context, '/credits'); // Implement your path
                  },
                ),
              ], // ABOUT
            ),
            buildListItem(
              'Disclaimer',
              const Icon(Icons.arrow_downward),
              onTapFunc: () {
                callPath(context, '/disclaimer'); // Implement your path
              },
            ),
            buildListItem(
              'Feedback',
              const Icon(Icons.feedback),
              onTapFunc: () {
                callPath(context, '/feedback'); // Implement your path
              },
            ),
          ],
        ),
      ),
      body:
          // Center(
          //   child: Text('Home Page'),
          // ),
          Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 350.0,
                        child: Column(children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 300.0,
                                    width: 550.0,
                                    margin: const EdgeInsets.only(
                                        top: 5.0, left: 5.0, right: 5.0),
                                    child: Stack(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/fulltree.svg'), // SVG image (background)
                                        Positioned(
                                          top:
                                              30, // Adjust the top position as per your requirement
                                          left: 128,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: Image.asset(
                                              'assets/images/leaf1_left.png'), // First PNG image (overlay)
                                        ),
                                        Positioned(
                                          top:
                                              90, // Adjust the top position as per your requirement
                                          left: 90,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: Image.asset(
                                              'assets/images/leaf2_left.png'), // Second PNG image (overlay)
                                        ),
                                        Positioned(
                                          top:
                                              35, // Adjust the top position as per your requirement
                                          left: 260,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: Image.asset(
                                              'assets/images/leaf1_right.png'), // Second PNG image (overlay)
                                        ),
                                        Positioned(
                                          top:
                                              87, // Adjust the top position as per your requirement
                                          left: 315,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: Image.asset(
                                              'assets/images/leaf2_right.png'), // Second PNG image (overlay)
                                        ),
                                        Positioned(
                                          top:
                                              51, // Adjust the top position as per your requirement
                                          left: 105,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: SvgPicture.asset(
                                              'assets/images/redLeaf.svg'), // Second PNG image (overlay)
                                        ),
                                        Positioned(
                                          top:
                                              138, // Adjust the top position as per your requirement
                                          left: 297,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: SvgPicture.asset(
                                              'assets/images/yellowLeaf.svg'), // Second PNG image (overlay)
                                        ),
                                        Positioned(
                                          top:
                                              53, // Adjust the top position as per your requirement
                                          left: 254,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: SvgPicture.asset(
                                              'assets/images/orangeLeaf.svg'), // Second PNG image (overlay)
                                        ),
                                        Positioned(
                                          top:
                                              151, // Adjust the top position as per your requirement
                                          left: 98,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: SvgPicture.asset(
                                              'assets/images/purpleLeaf1.svg'), // Second PNG image (overlay)
                                        ),
                                        Positioned(
                                          top:
                                              172, // Adjust the top position as per your requirement
                                          left: 261,
                                          height: 20.0,
                                          width:
                                              20.0, // Adjust the left position as per your requirement
                                          child: SvgPicture.asset(
                                              'assets/images/purpleLeaf2.svg'), // Second PNG image (overlay)
                                        ),
                                        Positioned(
                                          top: 105,
                                          left: 140,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return const LinearGradient(
                                                    colors: [
                                                      Colors.yellow,
                                                      Colors.purple
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ).createShader(bounds);
                                                },
                                                child: const Text(
                                                  'Empowering',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .white, // The color of the text will be determined by the gradient
                                                  ),
                                                ),
                                              ),
                                              ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return const LinearGradient(
                                                    colors: [
                                                      Colors.yellow,
                                                      Colors.purple
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ).createShader(bounds);
                                                },
                                                child: const Text(
                                                  'Women',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .bold // The color of the text will be determined by the gradient
                                                      ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return const LinearGradient(
                                                    colors: [
                                                      Colors.yellow,
                                                      Colors.purple
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ).createShader(bounds);
                                                },
                                                child: const Text(
                                                  'to transform India',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors
                                                        .white, // The color of the text will be determined by the gradient
                                                  ),
                                                ),
                                              ),
                                            ], // children
                                          ),
                                        ),
                                        const Positioned(
                                          top: 55,
                                          left: 25,
                                          child: Text(
                                            'Financial Services',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.redAccent),
                                          ),
                                        ),
                                        Positioned(
                                          top: 58,
                                          left: 278,
                                          child: Text(
                                            'Advisory and Support',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.orange[600]),
                                          ),
                                        ),
                                        Positioned(
                                          top: 145,
                                          left: 320,
                                          child: Text(
                                            'WE Community',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.yellow[700]),
                                          ),
                                        ),
                                        Positioned(
                                          top: 155,
                                          left: 6,
                                          child: Text(
                                            'Business Incubation',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.indigo[200]),
                                          ),
                                        ),
                                        Positioned(
                                          top: 180,
                                          left: 290,
                                          child: Text(
                                            'Events',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.indigo[200]),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 198,
                                          left: 85,
                                          child: Text(
                                            'Funding',
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 240,
                                          left: 35,
                                          child: Text(
                                            'Incubation and Acceleration',
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 257,
                                          left: 77,
                                          child: Text(
                                            'Mentoring and Networking',
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 245,
                                          left: 210,
                                          child: Text(
                                            'Market Linkages',
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 245,
                                          left: 290,
                                          child: Text(
                                            'Business Development Services',
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 215,
                                          left: 320,
                                          // child: Html(
                                          //   data: '<p> hughsdhfuihf</p>'
                                          // )
                                          child: Text(
                                            'Research and Innovation',
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ], // children
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ])),
                    Container(
                      height: 550.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'WEP in a minute',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'The Women Entrepreneurship Platform (WEP) is a first of its kind, unified access portal which brings together women from different parts of India to build a nurturing ecosystem that enables them to realize their entrepreneurial aspirations.',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          TextButton(
                            onPressed: () {
                              callClass(context, AboutUs());
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'KNOW MORE',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 300.0,
                            width: 400.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: VideoScreen(),
                          ),
                          // SizedBox(height: 20),
                          // AspectRatio(
                          //   aspectRatio: _controller.value.aspectRatio,
                          //   child: Stack(
                          //     alignment: Alignment.bottomCenter,
                          //     children: [
                          //       VideoPlayer(_controller),
                          //       VideoProgressIndicator(
                          //         _controller,
                          //         allowScrubbing: true,
                          //         padding: EdgeInsets.all(8.0),
                          //       ),
                        ],
                      ),
                    ),
                    Container(
                        height: 250.0,
                        width: 350.0,
                        // color: Colors.purple[50],
                        margin: const EdgeInsets.all(40),
                        padding: const EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.purple.shade50,
                            width: 2,
                          ),
                        ),
                        child: Column(children: <Widget>[
                          const Text('Resources',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              )),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Everything from government schemes to resources for your entrepreneurial journey.',
                              softWrap: true,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUs()),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Explore All Resources',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ])),
                    Container(
                      height: 1050.0,
                      width: 350.0,
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.purple.shade50,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text('WE Community',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              )),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Build your network by connecting with the industry experts, peers and the support systems of WEP.',
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              ('assets/images/community.png'),
                            ),
                          ),
                          Container(
                            height: 550.0,
                            width: 300.0,
                            margin: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 200.0,
                                  child: Column(children: [
                                    const SizedBox(height: 30),
                                    SvgPicture.asset(
                                      'assets/images/commLeaf1.svg', // Replace with your SVG file path
                                      // width: 200,  // Set the desired width
                                      // height: 200, // Set the desired height
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        callClass(context, LoginPage());
                                      },
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'Community',
                                              style: TextStyle(
                                                color: Colors.black,
                                                // fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.justify,
                                              // Text(
                                              semanticsLabel:
                                                  'Talk, learn and exchange views with your fellow entrepreneurs',
                                              softWrap: true,
                                              // style: TextStyle(
                                              //   fontSize: 12.0,
                                              // ),
                                              // ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // const Text(
                                    //   'The Community',
                                    //   style: TextStyle(
                                    //     color: Colors.black,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    //   textAlign: TextAlign.justify,
                                    // ),
                                    // const Text(
                                    //   'Talk, learn and exchange views with your fellow entrepreneurs',
                                    //   softWrap: true,
                                    //   style: TextStyle(
                                    //     fontSize: 12.0,
                                    //   ),
                                    // ),
                                    // const Icon(
                                    //   Icons.arrow_forward,
                                    //   color: Colors.black,
                                    // ),
                                  ]),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 200.0,
                                  child: Column(children: [
                                    Column(children: [
                                      SvgPicture.asset(
                                          'assets/images/commLeaf2.svg'),
                                      const Text(
                                        'Partners',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'Speak to experts in the field and get to learn from the best in the country',
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black,
                                      ),
                                    ]),
                                    const SizedBox(height: 30),
                                  ]),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 200.0,
                                  child: Column(children: [
                                    Column(children: [
                                      SvgPicture.asset(
                                          'assets/images/commLeaf3.svg'),
                                      const Text(
                                        'Events',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'Be a part of online and offline events that help you and your business grow',
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black,
                                      ),
                                    ])
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500.0,
                      width: 370.0,
                      decoration: BoxDecoration(
                        // color: Colors.purple.shade50,
                        border: Border.all(
                          color: Colors.purple.shade50,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 50,
                            width: 390,
                            alignment: Alignment.center,
                            child: const Text(
                              'Partner with the best!',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 1),
                            height: 80,
                            width: 390,
                            child: IconRow(
                                context,
                                "assets/images/crisil.png",
                                "assets/images/dhriti.png",
                                "assets/images/gates.png"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            height: 80,
                            width: 390,
                            child: IconRow(
                                context,
                                "assets/images/cisco.png",
                                "assets/images/sidbi.png",
                                "assets/images/paypal.jpg"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 50,
                            width: 390,
                            alignment: Alignment.center,
                            child: const Text(
                              'and many more ...',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
/////////////////////////////////////////
                          TextButton(
                            onPressed: () {
                              callClass(context, Partners());
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Explore All Partners',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          ////////////////////////////////////////////////
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              color: Colors.purple[50],
              child: Footer(
                  context,
                  Icons.home,
                  Icons.explore,
                  FontAwesomeIcons.equals,
                  Icons.person,
                  HomePage(),
                  LoginPage(),
                  LoginPage(),
                  LoginPage()),
            ),
          ),
        ],
      ),

//////////////////////////////////////////////////
    );
  }
}
