import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final String keyword;

  const SearchResultsPage({required this.keyword});

  @override
  Widget build(BuildContext context) {
    final List<String> schemes = [
      'Women Enterprise Development',
      'Stand Up India Scheme',
      'Amended Technology Upgradation Funds Scheme (ATUFS)',
      'Scheme for Assistance for Start Ups/Innovation',
      'Entrepreneurship and Skill Development Programme',
    ];

    final List<String> descriptions = [
      'North Eastern Development Finance Corporation Limited has introduced the Women Enterprise Development Scheme for women entrepreneurs. As the name suggests, the scheme helps in motivating women entrepreneurship by financially supporting the project.',
      'Stand-Up India was launched by the Government of India on 5 April 2016 to support entrepreneurship among women and SC & ST communities.',
      'It is a credit linked Capital Investment Subsidy (CIS) scheme during 2016 to 2022 to catalyze capital investments for technology upgradation and modernization of the textile industry.',
      'Quantum of Assistance 1. Sustenance allowance of Rs 20,000 per month. 2. Seed support of up to Rs 30 lakhs 3. Pre Series A funding 4. Interest subsidy 5. Assistance to enroll and participate in acceleration programs 6. Assistance for skill development',
      'Entrepreneurship Skill Development Programme (ESDP): It is an entrepreneurship scheme that nurtures the talent of youth by enlightening them on several aspects of industrial or business activity that are required for setting up MSES.',
    ];

    final List<String> filteredSchemes = [];
    final List<String> filteredDescriptions = [];

    for (int i = 0; i < schemes.length; i++) {
      if (schemes[i].toLowerCase().contains(keyword.toLowerCase()) ||
          descriptions[i].toLowerCase().contains(keyword.toLowerCase())) {
        filteredSchemes.add(schemes[i]);
        filteredDescriptions.add(descriptions[i]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Search Results: $keyword'),
      ),
      body: filteredSchemes.isNotEmpty
          ? ListView.builder(
              itemCount: filteredSchemes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          filteredSchemes[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          filteredDescriptions[index],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(filteredSchemes[index]),
                                  content: SingleChildScrollView(
                                    child: Text(
                                      filteredDescriptions[index],
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('View More'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'No Result Found!',
                style: TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}
