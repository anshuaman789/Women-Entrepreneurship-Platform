import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideosPage(),
    );
  }
}

class VideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            VideoCard(
              heading: 'Women Entrepreneurship Platform 2.0',
              videoUrl: 'https://youtu.be/QTqnTfLQhps',
            ),
            VideoCard(
              heading:
                  'Anna Roy Of Niti Aayog | Women Entrepreneurship In India',
              videoUrl: 'https://youtu.be/rwzEjWIsUPg',
            ),
            VideoCard(
              heading: 'Launch of Women Entrepreneurship Platform 3.0',
              videoUrl:
                  'https://www.youtube.com/live/hg65cUY4uXw?feature=share',
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String heading;
  final String videoUrl;

  const VideoCard({required this.heading, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.video_library),
        title: Text(
          heading,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: () async {
          // ignore: deprecated_member_use
          if (await canLaunch(videoUrl)) {
            // ignore: deprecated_member_use
            await launch(videoUrl);
          }
        },
      ),
    );
  }
}
