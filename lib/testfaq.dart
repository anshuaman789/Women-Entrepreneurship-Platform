import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed Cards Example',
      // theme: ThemeData(
      //   primaryColor: Colors.purple, // Set the color for the AppBar and TabBar
      //   scaffoldBackgroundColor: Colors.white, // Set the background color for the body
      // ),
      home: FaqPage(),
    );
  }
}

class FaqPage extends StatefulWidget {
  @override
  FaqPageState createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabbed Cards Example'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              'FAQ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.orange, // Set the color of the TabBar indicator
            unselectedLabelColor: Colors.grey, // Color of the unselected tab labels
            labelColor: Colors.black, // Color of the selected tab label
            tabs: [
              Tab(

                text: 'Tab 1',
              ),
              Tab(
                text: 'Tab 2',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FaqList(
                  faqs: [
                    FaqData(
                      title: 'Card 1',
                      dropdownItems: [
                        DropdownItem('Heading 1', 'Description 1'),
                        DropdownItem('Heading 2', 'Description 2'),
                      ],
                    ),
                    FaqData(
                      title: 'Card 2',
                      dropdownItems: [
                        DropdownItem('Heading 3', 'Description 3'),
                        DropdownItem('Heading 4', 'Description 4'),
                      ],
                    ),
                  ],
                ),
                FaqList(
                  faqs: [
                    FaqData(
                      title: 'Card 3',
                      dropdownItems: [
                        DropdownItem('Heading 5', 'Description 5'),
                        DropdownItem('Heading 6', 'Description 6'),
                      ],
                    ),
                    FaqData(
                      title: 'Card 4',
                      dropdownItems: [
                        DropdownItem('Heading 7', 'Description 7'),
                        DropdownItem('Heading 8', 'Description 8'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FaqData {
  final String title;
  final List<DropdownItem> dropdownItems;

  FaqData({required this.title, required this.dropdownItems});
}

class DropdownItem {
  final String heading;
  final String description;

  DropdownItem(this.heading, this.description);
}

class FaqList extends StatelessWidget {
  final List<FaqData> faqs;

  FaqList({required this.faqs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return FaqWidget(faqData: faqs[index]);
      },
    );
  }
}

class FaqWidget extends StatefulWidget {
  final FaqData faqData;

  FaqWidget({required this.faqData});

  @override
  FaqWidgetState createState() => FaqWidgetState();
}

class FaqWidgetState extends State<FaqWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[50], // Set the color of the card
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          widget.faqData.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.faqData.dropdownItems.map((item) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.heading,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item.description),
                    SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
