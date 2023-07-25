import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(VideoApp());
}

class VideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player',
      theme: ThemeData.dark(),
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isFullScreen = false;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/women_entrepreneurship_platform_3.0.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
      if (_isFullScreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
  }

  void _decreaseSpeed() {
    setState(() {
      _playbackSpeed -= 0.5;
      if (_playbackSpeed < 0.5) {
        _playbackSpeed = 0.5;
      }
      _controller.setPlaybackSpeed(_playbackSpeed);
    });
  }

  void _increaseSpeed() {
    setState(() {
      _playbackSpeed += 0.5;
      if (_playbackSpeed > 2.0) {
        _playbackSpeed = 2.0;
      }
      _controller.setPlaybackSpeed(_playbackSpeed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !_isFullScreen ? AppBar(title: Text('Video Player')) : null,
      body: Stack(
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          if (!_isFullScreen)
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: _toggleFullScreen,
                child: Icon(Icons.fullscreen),
              ),
            ),
          if (_isFullScreen)
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: _toggleFullScreen,
                child: Icon(Icons.fullscreen_exit),
              ),
            ),
          if (_isFullScreen)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _decreaseSpeed,
                    icon: Icon(Icons.remove_circle),
                  ),
                  Text(
                    'Speed: ${_playbackSpeed.toStringAsFixed(1)}x',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    onPressed: _increaseSpeed,
                    icon: Icon(Icons.add_circle),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
