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
  var showMsg = false;
  List<CardItem> cardItems = [];
  List<ImageItem> imageItems = [];

//  var db = new MySql();
  var name = '';

  Future<List<Map<String, dynamic>>> fetchImage(
      String endpointurl, String id) async {
    List<Map<String, dynamic>> errorMsg = [
      {
        'Method': 'getImage',
      },
    ];
    print("ïd IN GETIMAGE=$id");
    try {
      print("inside getdata");
      print(Uri.parse(endpointurl));

      final apiURL = endpointurl; // Replace with the actual API URL
      final apiKey = API_KEY; // Replace with your API key

      // Prepare the request body
      final requestBody = {
        'id': id,
      };
      // Set the API key in the headers
      final headers = {
        'Content-Type': 'application/json',
        'API-Key': apiKey,
        'keep-alive': 'timeout=15, max=1000'
      };

      final response = await http
          .post(Uri.parse(apiURL),
              headers: headers, body: json.encode(requestBody))
          .timeout(Duration(seconds: 30));
      print(endpointurl);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Success");
        final parsedResponse = json.decode(response.body);
        if (parsedResponse is List) {
          return List<Map<String, dynamic>>.from(parsedResponse);
        } else {
          print("IMAGE ERROR OCCURED");
          throw Exception('Invalid response format from the Service.');
        }
      } else {
        throw Exception(
            'Failed to fetch data from the remote database. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("The error in fetchData method is: " + e.toString());
      errorMsg[0]['messaage'] = e.toString();
      return errorMsg; //   List<Map<String, dynamic>>.from(parsedResponse);
    }
  }

////////////////////////////////////////////
  Future<List<Map<String, dynamic>>> fetchData(String endpointurl) async {
    List<Map<String, dynamic>> errorMsg = [
      {
        'Method': 'getData',
      },
    ];

    try {
      print("inside getdata");
      print(Uri.parse(endpointurl));

      final apiURL = endpointurl; // Replace with the actual API URL
      final apiKey = API_KEY; // Replace with your API key

      // Prepare the request body
      final requestBody = {
        'search': _controller.text == null ? "" : _controller.text,
        'state': _selectedOption.toString() == null ? "" : _selectedOption,
        'sector': _selectedOption1.toString() == null ? "" : _selectedOption1,
      };
      String? s = requestBody['search'];
      String? o1 = requestBody['state'];

      print("Search = " + ((s == null) ? "NULL SRCH" : s));
      print("State = " + ((o1 == null) ? "NULL STATE" : o1));
      print("Area = " + _selectedOption1.toString());
      // Set the API key in the headers
      final headers = {
        'Content-Type': 'application/json',
        'API-Key': apiKey,
        'keep-alive': 'timeout=15, max=1000'
      };

      final response = await http
          .post(Uri.parse(apiURL),
              headers: headers, body: json.encode(requestBody))
          .timeout(Duration(seconds: 30));
      print(endpointurl);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Success");
        final parsedResponse = json.decode(response.body);
        if (parsedResponse is List) {
          return List<Map<String, dynamic>>.from(parsedResponse);
        } else {
          print("IMAGE ERROR OCCURED");
          throw Exception('Invalid response format from the Service.');
        }
      } else {
        throw Exception(
            'Failed to fetch data from the remote database. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("The error in fetchData method is: " + e.toString());
      errorMsg[0]['messaage'] = e.toString();
      return errorMsg; //   List<Map<String, dynamic>>.from(parsedResponse);
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////////

  Uint8List convert2Uint8List(String base64Image) {
    return base64Decode(base64Image);
  }

  //////////////////////////////////////////////////////////////////////////////////////////

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
      company: (row['organization'] == null) ? "-" : row['organization'],
      orgintro: (row['org_intro'] == null) ? "" : row['org_intro'],
      orgaddress: (row['org_address'] == null) ? "-" : row['org_address'],
      website: (row['website'] == null) ? "- " : row['website'],
      rname: (row['contact_name'] == null) ? "-" : row['contact_name'],
      phone: (row['phone'] == null) ? "-" : row['phone'],
      email: (row['email'] == null) ? "-" : row['email'],
      speciality: (row['business_area'] == null) ? " " : row['business_area'],
      vertical: (row['vertical_name'] == null) ? " " : row['vertical_name'],
    );
    setState(() {
      cardItems.add(newItem);
    });
  }

  void addImageItem(var id) async {
/////////////////////////////////////////////////////////////////////////////////
    var strList = [];
    print("ID is : $id");
    setState(() {
      fetchImage(dataUrl + "/search/image", id).then((data) {
        //      print("Data Fetched");
//        int cnt = 0, cnt1 = 0; // Handle fetched data
        for (final record in data) {
          record.forEach((key, value) {
            if (key != "icon_image_data") {
              strList.add(value);
            }
          });
        }
        //    print("Cnt=$cnt Cnt1=$cnt1");
      }).catchError((error) {
        print("In error");
        print(error);
      });
    });
    ///////////////////////////////////////////////////////////////////////////////
    var data;
    if (strList.length != 0)
      data = convert2Uint8List((strList[0] == null) ? dummyImage : strList[0]);
    else
      data = convert2Uint8List(dummyImage);

    ImageItem newItem = new ImageItem(
      imageData: data,
    );
    setState(() {
      imageItems.add(newItem);
    });
  }

  void getCards() {
    //  var data;

    deleteItem();
    Map<String, dynamic> Record = {};
    List<String> strList = [];
    int i = 0;
    setState(() {
      fetchData(dataUrl + "/search").then((data) {
        //      print("Data Fetched");
//        int cnt = 0, cnt1 = 0; // Handle fetched data
        for (final record in data) {
          strList.clear();
          i++;
          record.forEach((key, value) {
            i++;
            //      cnt++;
            //          print("key"+key+"   value = "+value);
            print("THE KEY IS = $key");
            if (key != "image_data") {
              Record[key] = value;
              strList.add(value);
            } else {
              addImageItem(value);
            }
          });
          addItem(Record);
        }
        if (i == 0) {
          setState(() {
            showMsg = true;
          });
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
                              hintText: 'Search - AI Powered',
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
                                      showMsg = false;
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
                                      showMsg = false;
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
                        visible: showMsg,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              width: double.infinity,
                              child: Text(
                                "We're working to bring you the latest information. Stay Tuned!",
                                softWrap: true,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.blue),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              width: double.infinity,
                              child: Text(
                                "Seems like what you’re looking for does not exist at the moment. We suggest you to search using different keywords or explore our resources.",
                                softWrap: true,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              return MyCard(
                                  orgintro: item.orgintro,
                                  orgaddress: item.orgaddress,
                                  vertical: item.vertical,
                                  company: item.company,
                                  website: item.website,
                                  name: item.rname,
                                  tel: item.phone,
                                  email: item.email,
                                  category: item.speciality,
                                  imageData: imgitem.imageData);
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
              color: Colors.red[200], // purple[50],
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
  final String orgintro;
  final String orgaddress;
  final String website;
  final String rname;
  final String phone;
  final String email;
  final String speciality;
  final String vertical;

  CardItem({
    // required this.image,
    required this.company,
    required this.orgintro,
    required this.orgaddress,
    required this.website,
    required this.rname,
    required this.phone,
    required this.email,
    required this.speciality,
    required this.vertical,
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
