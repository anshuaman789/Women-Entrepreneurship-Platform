import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../common/widgetslib.dart';
import 'dart:typed_data';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../common/variables.dart';
import '../common/widgetslib.dart';
import '../common/methodsfile.dart';

class PartnerDetails extends StatelessWidget {
  final String company;
  final String website;
  final String name;
  final String phone;
  final String email;
  final List<String> address;
  final String intro;
  final List<String>
      Services; // First Column Service Name, Second Column Details String
  final Uint8List imageData;

  int k = 0;
  PartnerDetails({
    required this.company,
    required this.name,
    required this.website,
    required this.phone,
    required this.email,
    required this.address,
    required this.intro,
    required this.Services,
    required this.imageData,
  });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partner Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white24,
          child: Column(

            crossAxisAlignment:   CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    color: Colors.purple[50],
                    margin: EdgeInsets.only(
                        left: 10, right: 0, top: 0, bottom: 0),
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      child:
                          //////////
                          Image.memory(this.imageData),
                    ),
                  ),
                  Container(
                    height: 75,
                    width: 315,
                    color: Colors.purple[50],
                    margin: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child:
                          //////////
                          Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          this.company,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  ///////////////
                ],
              ),  //
              Container(
                color: Colors.white12, // Holds Name, wensite, address etc.
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 1),
                width: double.infinity,

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child:
                    Container(
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple.shade50,
                      ),),
                      width: double.infinity,
                      padding: EdgeInsets.only(left:10, right:10, top:10, bottom:10),
                      margin: EdgeInsets.only(bottom:10),
                      child:
                      ///////////////////////////
                      HtmlWidget("<div style='font-size: 16px'><strong>"+this.intro+"</div>"),
                  /////////////////////////////
                    ),
                  // "data:text/html;charset=utf-8,” + Uri.encodeComponent(“<p>This is HTML<p>”),
                  // Html(data: "<p>This is HTML<p>"),
                  //   Text(
                  //     stripHtmlTags(''' <h1>Hello, <strong>World</strong>!</h1>
                  //     <ul>
                  //     <li>Item 1</li>
                  //     <li>Item 2</li>
                  //     <li>Item 3</li>
                  //     </ul>'''),
                  //   //this.intro,
                  //   softWrap: true,
                  // ),
                ),
              ),
              Container(
                //Contact Name
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 45,
                color: Colors.purple[50],
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Contact: " + this.name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white12, border: Border.all(color: Colors.purple.shade50),),
                 // Holds Name, wensite, address etc.
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  //Children for Name, website, address etc
                  children: <Widget>[
                    Padding(
                      // Phone
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.phone), // Replace with your desired icon
                          SizedBox(
                            width: 8.0,
                          ), // Add spacing between the icon and text
                          TextButton(
                            onPressed: () {
                              launchPhone(this.phone);
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  this.phone, //item.website),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), // Phone

                    Padding(
                      // Email
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.web), // Replace with your desired icon
                          SizedBox(
                            width: 8.0,
                          ), // Add spacing between the icon and text
                          Container(
                            width: 340,
                            child: TextButton(
                              onPressed: () {
                                launchUrlString(this.website);
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    this.website, //item.website),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), // Email

                    Padding(
                      // Email
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.email), // Replace with your desired icon
                          SizedBox(
                            width: 8.0,
                          ), // Add spacing between the icon and text
                          Container(
                            width: 290 * 320 / 411,
                            child: TextButton(
                              onPressed: () {
                                launchEmail(this.email);
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    this.email, //item.website),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), // Email

                    Padding(
                      // Address
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                              Icons.pin_drop), // Replace with your desired icon
                          SizedBox(
                            width: 8.0,
                          ),

                          // Add spacing between the icon and text
                          Container(
                            width: 340,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < this.address.length; i++)
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      this.address[i],
                                      softWrap: true,
                                    ),
                                  ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
//////////
                        ],
                      ),
                    ), // Address

////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                //Contact Name
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 45,
                color: Colors.purple[50],
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Services Provided",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10), width: 390,
                color: Colors.white12,
                child: Padding(
                  // Address
                  padding: EdgeInsets.only(left: 10, top:20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      // Add spacing between the icon and text
                      if(this.Services[0].toString() != null && this.Services[0].toString() != "")
                        Text(this.Services[0].toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      if(this.Services[0].toString() != null && this.Services[0].toString() != "")
                      SizedBox(height: 10),
                      if(this.Services[1].toString() != null && this.Services[1].toString() != "")
                        Text(this.Services[1].toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      if(this.Services[1].toString() != null && this.Services[1].toString() != "")
                      SizedBox(height: 10),

                      HtmlWidget("<div style='font-size: 16px'><strong>"+this.Services[2]+"</div>"),

//////////
                    ],
                  ), //Make Col

                ), // Address
              ),
            ],
          ),
        ),
      ), //),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//     Container(
//       // Main for Intro
//       height: 290.0,
//       width: 450.0,
//       color: Colors.indigo[200], // Colors.pink[50],  //Colors.purple[50],
//       padding: EdgeInsets.only(
//           top: 20.0, left: 1.0, right: 1.0, bottom: 1.0),
//       margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
//       child: Row(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 1),
//             height: 280.0,
//             width: 220.0,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 200.0,
//                   width: 200.0,
//                   padding: EdgeInsets.only(right: 1),
//
//                   child: Text(
//                     """"WEP welcomes the call for action given by Hon'ble PM towards a more sustainable way of life. WEP would undertake a series of initiatives to encourage and highlight women empowering Life""",
//                     softWrap: true,
//                     overflow: TextOverflow.clip,
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       fontStyle: FontStyle.italic,
//                     ),
//                     textAlign: TextAlign.justify,
//                   ),
//                 ),
//                 Container(
//                   height: 25.0,
//                   width: 200.0,
//                   padding: EdgeInsets.only(right: 1),
//
//                   child: Text(
//                     "Ms. Anna Roy",
//                     style: TextStyle(
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//                 Container(
//                   // Text
//                   height: 25.0,
//                   width: 200.0,
//
//                   padding: EdgeInsets.only(right: 1),
//                   child: Text(
//                     "Mission Director, WEP",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Container(
//             width: 165, // Specify the desired width of the container
//             height: 200, // Specify the desired height of the container
//
//             margin: EdgeInsets.only(left: 10, bottom: 50),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.black, // Border color
//                 width: 1.0, // Border width
//               ),
//               image: DecorationImage(
//                 image: MemoryImage(this.imageData),
//
//                 fit: BoxFit
//                     .cover, // Fill the container with the image, maintaining aspect ratio
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//     Container(
//       // color: Colors.pink[300],
//       padding:
//       EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
//       margin: EdgeInsets.only(top: 30, left: 10, right: 10),
//       child: Text('Our Journey',
//         style: TextStyle(
//             color: Colors.blueGrey,
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//     Container(
//       // color: Colors.pink[300],
//       padding:
//       EdgeInsets.only(top: 1.0, left: 6.0, right: 6.0, bottom: 6.0),
//       margin: EdgeInsets.only(top: 1, left: 10, right: 10),
//       child: Text(
//           'The Women Entrepreneurship Platform (WEP) is a first of its kind, unified access portal which brings together women from different parts of India to build a nurturing ecosystem that enables them to realize their entrepreneurial aspirations. WEP achieves this by facilitating relevant information and services through key partnerships.',
//           softWrap: true,
//           style: TextStyle(
//               color: Colors.black,
//               fontSize: 20.0,
//               fontWeight: FontWeight.normal),
//           textAlign: TextAlign.justify),
//     ),
//
//     Container(
//       //  height: 190,
//       child: EventScroll(),
//     ),
//
//     Container(
//       // Yellow box
//       height: 260.0,
//       width: 450.0,
//       color: Colors.orange[300],
//       padding: EdgeInsets.only(
//           top: 10.0, left: 1.0, right: 1.0, bottom: 1.0),
//       margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
//       child: Container(
//         padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
//         child: Text(
//           'As an enabling platform, WEP is built on three pillars',
//           style: TextStyle(
//             color: Colors.blueGrey,
//             fontWeight: FontWeight.bold,
//             fontSize: 40.0,
//           ),
//           textAlign: TextAlign.justify,
//         ),
//       ),
//     ),
//     Container(
//       // Yellow box
//       height: 750.0,
//       width: 450.0,
//       color: Colors.purple[50],//.orange[50],
//       padding: EdgeInsets.only(
//           top: 20.0, left: 1.0, right: 1.0, bottom: 1.0),
//       margin: EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
//       child: Container(
//           padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
//           child: Column(
//               children: <Widget>[
//                 Text('\n01',
//                     style: TextStyle(
//                       fontSize: 25.0,
//                       color: Colors.orange[400],
//                       fontWeight: FontWeight.bold,
//                     )),
//                 Text('\n Iccha Shakti',
//                     softWrap: true,
//                     style: TextStyle(
//                       fontSize: 25.0,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                     )),
//                 Container(
//                     height:120.0,
//                     width:320.0,
//                     padding: EdgeInsets.only(top:10.0, left:10.0 , right:10.0),
//                     child: Text('Represents motivating aspiring entrepreneurs to start their business',
//                       softWrap : true,
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.blueGrey,
//                         fontWeight: FontWeight.normal,
//                       ),
//                       textAlign: TextAlign.justify,)
//                 ),
//                 Text('\n02',
//                     style: TextStyle(
//                       fontSize: 25.0,
//                       color: Colors.orange[400],
//                       fontWeight: FontWeight.bold,
//                     )),
//                 Text('\n Gyaan Shakti',
//                     style: TextStyle(
//                       fontSize: 25.0,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                     )),
//                 Container(
//                     height:120.0,
//                     width:320.0,
//                     padding: EdgeInsets.only(top:10.0, left:10.0 , right:10.0),
//                     child: Text('Represents providing knowledge and ecosystem support to women entrepreneurs to foster entrepreneurship\n',
//                       softWrap : true,
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.blueGrey,
//                         fontWeight: FontWeight.normal,
//                       ),
//                       textAlign: TextAlign.justify,)
//                 ),
//                 Text('\n03',
//                     style: TextStyle(
//                       fontSize: 25.0,
//                       color: Colors.orange[400],
//                       fontWeight: FontWeight.bold,
//                     )),
//                 Text('\n Karma Shakti',
//                     style: TextStyle(
//                       fontSize: 25.0,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                     )),
//                 Container(
//                     height:120.0,
//                     width:320.0,
//                     padding: EdgeInsets.only(top:10.0, left:10.0 , right:10.0),
//                     child: Text('Represents providing hands-on support to entrepreneurs in setting and scaling up businesses',
//                       softWrap : true,
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.blueGrey,
//                         fontWeight: FontWeight.normal,
//                       ),
//                       textAlign: TextAlign.justify,)
//                 ),
//
//               ]
//           )
//       ),
//     ),
//     Container(
//       // color: Colors.pink[300],
//       padding:
//       EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
//       margin: EdgeInsets.only(top: 30, left: 10, right: 10),
//       child: Text('What we have to offer',
//         style: TextStyle(
//             color: Colors.blueGrey,
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//     Container(
//       // color: Colors.pink[300],
//       padding:
//       EdgeInsets.only(top: 1.0, left: 6.0, right: 6.0, bottom: 6.0),
//       margin: EdgeInsets.only(top: 1, left: 10, right: 10),
//       child: Text(
//           'As an aggregator platform, WEP hosts information and services relevant to women entrepreneurs. WEP enables key partnerships to bring crucial content, workshops, campaigns and other avenues of learning and growth to its users from trailblazers in the industry. Through its partnerships, services are provided in 6 main focus areas\n',
//           softWrap: true,
//           style: TextStyle(
//               color: Colors.black,
//               fontSize: 20.0,
//               fontWeight: FontWeight.normal),
//           textAlign: TextAlign.justify),
//     ),
//     Container(
//         child: Column(
//             children: <Widget> [
//               BulletPointTextButton("Funding", Icons.circle),
//               BulletPointTextButton("Incubation and Acceleration", Icons.circle),
//               BulletPointTextButton("Mentoring and Networking", Icons.circle),
//               BulletPointTextButton("Market Linkages", Icons.circle),
//               BulletPointTextButton("Business Development Services", Icons.circle),
//               BulletPointTextButton("Resarch and Innovation", Icons.circle),
//
//             ]
//         )
//     ),
//     Container(
//       // color: Colors.pink[300],
//       padding:
//       EdgeInsets.only(top: 1.0, left: 6.0, right: 6.0, bottom: 6.0),
//       margin: EdgeInsets.only(top: 1, left: 10, right: 10),
//       child: Text(
//           '\nFor this, WEP encourages entrepreneurs to share their entrepreneurial journeys, stories & experiences to nurture peer learning. All of this is further strengthened by the mentorship of industry players.\n'
//               '\nWEP platform, as a driver of change, will also promote offline initiatives and outreach programmes to promote the entrepreneurial spirit among potential women entrepreneurs, in collaboration with partner organizations.\n',
//           softWrap: true,
//           style: TextStyle(
//               color: Colors.black,
//               fontSize: 20.0,
//               fontWeight: FontWeight.normal),
//           textAlign: TextAlign.justify),
//     ),
//   ],
// )

// class OneDimListWidget extends StatelessWidget {
//   @override
//   final List<String> str;
//
//   OneDimListWidget({required this.str});
//
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: ListView.builder(
//         itemCount: str.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(str[index]),
//           );
//         },
//       ),
//     );
//   }
// }
