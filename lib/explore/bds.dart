import 'package:flutter/material.dart';

void main() {
  runApp(const bdsPage());
}

class bdsPage extends StatefulWidget {
  const bdsPage({Key? key}) : super(key: key);

  @override
  _bdsPageState createState() => _bdsPageState();
}

class _bdsPageState extends State<bdsPage> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Development Services',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Business Development Services'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
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
                  'Business Development Services',
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
                  decoration: InputDecoration(
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
                        // Perform search logic here
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
        bottomNavigationBar: const BottomAppBar(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: 'Top Trending',
                  child: Icon(Icons.trending_up),
                ),
                Tooltip(
                  message: 'Central Schemes',
                  child: Icon(Icons.account_balance),
                ),
                Tooltip(
                  message: 'SIDBI+NABARD',
                  child: Icon(Icons.business),
                ),
                Tooltip(
                  message: 'State Schemes',
                  child: Icon(Icons.event),
                ),
                Tooltip(
                  message: 'Knowledge Bank',
                  child: Icon(Icons.video_library),
                ),
                Tooltip(
                  message: 'Partners',
                  child: Icon(Icons.people),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
