import 'package:flutter/material.dart';
import '../cards/top_trending.dart';
import '../cards/central_scheme.dart';
import '../cards/sidbi.dart';
import '../cards/state_scheme.dart';
import '../cards/knowledgeBank.dart';
import '../cards/videos.dart';
import '../search/search_results.dart'; // Import top_trending.dart

void main() {
  runApp(const FundingPage());
}

class FundingPage extends StatefulWidget {
  const FundingPage({Key? key}) : super(key: key);

  @override
  _FundingPageState createState() => _FundingPageState();
}

class _FundingPageState extends State<FundingPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  String? _selectedTarget;
  TextEditingController _searchController = TextEditingController();

  void _resetForm() {
    setState(() {
      _formKey.currentState?.reset();
      _searchController.clear();
      _selectedGender = null;
      _selectedTarget = null;
    });
  }

  void navigateToSearchResultsPage(String keyword) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchResultsPage(keyword: keyword)),
    );
  }

  void navigateToTopTrendingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TopTrendingPage()),
    );
  }

  void navigateToCentralSchemePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => centralSchemePage()),
    );
  }

  void navigateToSIDBIPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => sidbiPage()),
    );
  }

  void navigateToStateSchemePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => stateSchemePage()),
    );
  }

  void navigateToVideoPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VideosPage()),
    );
  }

  void navigateToKnowldegeBankPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => knowledgeBankPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funding',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Funding'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Funding',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Everything from government schemes to templates for your entrepreneurial journey.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                      ),
                      value: _selectedGender,
                      items: ['Male', 'Female', 'Other'].map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Target Audience',
                      ),
                      value: _selectedTarget,
                      items: [
                        'Labor in enterprise',
                        'Enterprises',
                        'Third parties',
                        'Entrepreneurs options'
                      ].map((String target) {
                        return DropdownMenuItem<String>(
                          value: target,
                          child: Text(target),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedTarget = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        navigateToSearchResultsPage(_searchController.text);
                      },
                      child: const Text('Search'),
                    ),
                    ElevatedButton(
                      onPressed: _resetForm,
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap:
                      navigateToTopTrendingPage, // Navigate to the 'Top Trending' page
                  child: const Tooltip(
                    message: 'Top Trending',
                    child: Icon(Icons.trending_up),
                  ),
                ),
                InkWell(
                  onTap: navigateToCentralSchemePage,
                  child: const Tooltip(
                    message: 'Central Schemes',
                    child: Icon(Icons.account_balance),
                  ),
                ),
                InkWell(
                  onTap: navigateToSIDBIPage,
                  child: const Tooltip(
                    message: 'SIDBI+NABARD',
                    child: Icon(Icons.business),
                  ),
                ),
                InkWell(
                  onTap: navigateToStateSchemePage,
                  child: const Tooltip(
                    message: 'State Schemes',
                    child: Icon(Icons.event),
                  ),
                ),
                InkWell(
                  onTap: navigateToVideoPage,
                  child: const Tooltip(
                    message: 'Videos',
                    child: Icon(Icons.video_library),
                  ),
                ),
                InkWell(
                  onTap: navigateToKnowldegeBankPage,
                  child: const Tooltip(
                    message: 'Knowledge Bank',
                    child: Icon(Icons.book),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
