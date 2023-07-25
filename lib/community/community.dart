import 'package:flutter/material.dart';
import 'mypost.dart';
import 'makepost.dart';
import 'recent.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0; // Variable to store the current active tab index

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex =
            _tabController.index; // Update the current index on tab change
      });
    });
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
        title: const Text('Community'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TabBarButton(
                  text: 'Recent',
                  onPressed: () {
                    _tabController.animateTo(0);
                  },
                  isSelected: _currentIndex == 0, // Check if this tab is active
                ),
                TabBarButton(
                  text: 'Popular',
                  onPressed: () {
                    _tabController.animateTo(1);
                  },
                  isSelected: _currentIndex == 1,
                ),
                TabBarButton(
                  text: 'My Posts',
                  onPressed: () {
                    _tabController.animateTo(2);
                  },
                  isSelected: _currentIndex == 2,
                ),
                TabBarButton(
                  text: 'Recommended',
                  onPressed: () {
                    _tabController.animateTo(3);
                  },
                  isSelected: _currentIndex == 3,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RecentPage(SampleData
                    .getSampleData()), // Display RecentPage with sample data
                const Center(child: Text('Popular')),
                MyPostsPage(),
                const Center(child: Text('Recommended')),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPost = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MakePostPage()),
          );

          // Handle the new post data here if needed
          if (newPost != null) {
            // Add the new post data to the recentPosts list or update the UI accordingly.
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TabBarButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isSelected; // Variable to check if the tab is active

  const TabBarButton(
      {required this.text, this.onPressed, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.black, // Text color based on selection
          ),
        ),
        style: ButtonStyle(
          backgroundColor: isSelected
              ? MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 234, 171, 245)!)
              : null,
        ),
      ),
    );
  }
}
