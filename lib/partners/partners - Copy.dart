import 'package:wep_project/common/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import '../common/widgetslib.dart';
import '../community/community.dart';
import '../general/profilepage.dart';
import '../home/afhome.dart';
import 'partnercard.dart';

import '../feedback/feedback.dart';

class Partners extends StatefulWidget {
  @override
  PartnersState createState() => PartnersState();
}

class PartnersState extends State<Partners> {
  String? _selectedOption, _selectedOption1;
  final TextEditingController _controller = TextEditingController();
  var showCard = false;
  List<CardItem> cardItems = [];
  List<ImageItem> imageItems = [];

//  var db = new MySql();
  var name = '';

  Future<List<Map<String, dynamic>>> fetchData(String endpointurl) async {
    List<Map<String, dynamic>> error = [
      {
        'Method': 'getData',
        'Status': 'Error!!',
      },
    ];

    try {
      print("inside getdata");
      print(Uri.parse(endpointurl));

      final response = await http.get(Uri.parse(endpointurl));
//      final response = await http.get(Uri.parse('http://192.168.1.2:3000/data'));

      print(endpointurl);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Success");
        final parsedResponse = json.decode(response.body);
        // print(parsedResponse); // Print the parsed response for debugging purposes
        if (parsedResponse is List) {
          return List<Map<String, dynamic>>.from(parsedResponse);
        } else {
          print("IMAGE ERROR OCCURED");
          throw Exception('Invalid response format from the remote database.');
        }
      } else {
        throw Exception(
            'Failed to fetch data from the remote database. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("The error is: " + e.toString());
      return error; //   List<Map<String, dynamic>>.from(parsedResponse);
      ;
    }
  }

  Uint8List convert2Uint8List(String base64Image) {
    return base64Decode(base64Image);
  }

  void deleteItem() async {
    setState(() {
      var a = cardItems.length;
      print("Cards Count = $a");
      int i = 0;
      while (a > 0) {
        print("Removing $i");
        i++;
        cardItems.removeAt(0);
        a = cardItems.length;
      }
    });
  }

  void addItem(var row) async {
    CardItem newItem = CardItem(
      company: (row[0] == null || row[0] == '') ? "-" : row[0],
      website: (row[1] == null || row[1] == '') ? "-" : row[1],
      rname: (row[2] == null || row[2] == '') ? "-" : row[2],
      phone: (row[3] == null || row[3] == '') ? "-" : row[3],
      email: (row[4] == null || row[4] == '') ? "-" : row[4],
      speciality: (row[5] == null || row[5] == '') ? "-" : row[5],
    );
    setState(() {
      cardItems.add(newItem);
      //   print("added item to card");
    });
  }

  void addImageItem(var data) async {
    ImageItem newItem = new ImageItem(
      imageData: data,
    );
    setState(() {
      imageItems.add(newItem);
      //    print("added item to Image");
    });
  }

  void getCards() {
    var data;

    deleteItem();
    //  print("After Delete");
    List<String> strList = [];
    int i = 0;
    setState(() {
      fetchData(dataUrl + "/image").then((data) {
        //      print("Data Fetched");
        int cnt = 0, cnt1 = 0; // Handle fetched data
        for (final record in data) {
          strList.clear();
          i = 0;
          record.forEach((key, value) {
            i++;
            cnt++;
            if (i < 7)
              strList.add(value);
            else {
              cnt1++;
              //        print(value);
              addImageItem(
                convert2Uint8List(
                  (value == null) ? dummyImage : value,
                ),
              ); // Base64Encoded String
            }
          });
          addItem(strList);
        }
        //    print("Cnt=$cnt Cnt1=$cnt1");
      }).catchError((error) {
        print("In error");
        print(error);
      });
    });
  }

  void toggleCardVisibility() {
    showCard = !showCard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partners'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Heading(
                          "Partners", Colors.blueGrey, 36.0, FontWeight.bold),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 8.0, bottom: 10.0),
                        child: Text(
                          'Our partners guide and aid women who are changing the Indian entrepreneurial landscape.',
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Arial',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white70,
                        margin: EdgeInsets.only(right: 5),
                        padding:
                            EdgeInsets.only(top: 1.0, left: 10.0, right: 8),
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 8.0),
                              prefixIcon: const Icon(Icons.search),
                              // enabledBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color: Colors.blue, width: 1.0),
                              //),
                              //focusedBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color: Colors.blue, width: 3.0),
                              //),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 12.0, top: 5.0),
                        margin: EdgeInsets.only(left: 5, right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //  border: Border. .fromBorderSide(LinearBorder.bottom(size:1)) ,//..all(color: Colors.blueAccent),
                          color: Colors.white70,
                        ),
                        //shape: BoxShape.rectangle),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _selectedOption,
                          items: StateUT.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption = newValue;
                            });
                          },
                          hint: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Select State/UT',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 * wF,
                      ),
                      Container(
//            height: 50.0,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        padding: EdgeInsets.only(left: 5, top: 10),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.blueAccent),
                          color: Colors.white70,
                        ),
                        //  shape: BoxShape.rectangle),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _selectedOption1,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption1 = newValue;
                            });
                          },
                          items: BizSector.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Select Business Area',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15 * hF),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  child: Text('Search'),
                                  onPressed: () {
                                    setState(() {
                                      showCard = true;
                                      getCards();
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.indigo.shade300),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(80.0, 35.0)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  child: Text('Reset'),
                                  onPressed: () {
                                    deleteItem();
                                    setState(() {
                                      showCard = false;
                                      _selectedOption = null;
                                      _selectedOption1 = null;
                                      _controller.text = '';
                                    });
                                    // Handle button press
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.indigo.shade300),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(80.0, 35.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: !showCard,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 50,
                              width: 390,
                              alignment: Alignment.center,
                              child: Text(
                                'Partner with the best!',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1),
                              height: 80,
                              width: 390,
                              child: IconRow(
                                  context,
                                  "assets/images/crisil.png",
                                  "assets/images/dhriti.png",
                                  "assets/images/gates.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              height: 80,
                              width: 390,
                              child: IconRow(
                                  context,
                                  "assets/images/cisco.png",
                                  "assets/images/sidbi.png",
                                  "assets/images/paypal.jpg"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 50,
                              width: 390,
                              alignment: Alignment.center,
                              child: Text(
                                'and many more ...',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: showCard, //showCard,
                        child: Container(
                          //height: MediaQuery.of(context).size.height-512, // Provide a fixed height constraint
                          height: 369,
                          child: ListView.builder(
                            itemCount: cardItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              CardItem item = cardItems[index];
                              ImageItem imgitem = imageItems[index];
                              // return MyCard(
                              //     company: item.company,
                              //     website: item.website,
                              //     name: item.rname,
                              //     tel: item.phone,
                              //     email: item.email,
                              //     category: item.speciality,
                              //     imageData: imgitem.imageData);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ////////////////
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
      ///////////////////
    );
  }

  List<String> StateUT = [
    "Andaman and Nicobar Islands",
    "Andhra Prdesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman & Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshdweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Orissa",
    "Outside India",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttrakhand",
    "West Bengal",
  ];

  List<String> BizSector = [
    "IT",
    "Financial Services",
    "Entrepreneurship Development",
    "Advisory and Support",
    "Social Media",
    "Technology Business Incubation",
    "Digital Payments"
  ];
}

Widget _buildCard(String name) {
  return Container(
    child: Card(
      color: Colors.purple.shade50,
      elevation: 8.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text('Card Title'),
            subtitle: Text('Card Subtitle'),
          ),
          Container(
            color: Colors.black12,
            padding: EdgeInsets.all(10.0),
            //margin: EdgeInsets.all(16.0),
            child: Text(
              'This is Main Body of the card.\n It displays Description.$name',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Text(
                  'Button 1',
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Button 2'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class CardItem {
  // final ImageProvider image;
  final String company;
  final String website;
  final String rname;
  final String phone;
  final String email;
  final String speciality;

  CardItem({
    // required this.image,
    required this.company,
    required this.website,
    required this.rname,
    required this.phone,
    required this.email,
    required this.speciality,
  });
}

class ImageItem {
  // final ImageProvider image;
  Uint8List imageData = Uint8List(0);

  ImageItem({
    // required this.image,
    required this.imageData,
  });
}
