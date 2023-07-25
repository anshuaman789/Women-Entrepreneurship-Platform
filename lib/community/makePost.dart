import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class MakePostPage extends StatefulWidget {
  @override
  _MakePostPageState createState() => _MakePostPageState();
}

class _MakePostPageState extends State<MakePostPage> {
  File? _image;
  File? _video;
  TextEditingController _queryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _video = null; // Clear the video file if an image is selected
      });
    }
  }

  Future<void> _pickVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _video = File(pickedFile.path);
        _image = null; // Clear the image file if a video is selected
      });
    }
  }

  Future<String> _uploadToFirestore() async {
    final storage = FirebaseStorage.instance;
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    if (_image != null) {
      final reference = storage.ref().child('posts/$fileName.jpg');
      final uploadTask = reference.putFile(_image!);

      setState(() {
        isLoading = true;
      });

      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadURL = await snapshot.ref.getDownloadURL();

      setState(() {
        isLoading = false;
      });

      return downloadURL;
    } else if (_video != null) {
      final reference = storage.ref().child('posts/$fileName.mp4');
      final uploadTask = reference.putFile(_video!);

      setState(() {
        isLoading = true;
      });

      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadURL = await snapshot.ref.getDownloadURL();

      setState(() {
        isLoading = false;
      });

      return downloadURL;
    }

    return '';
  }

  Future<void> _post() async {
    final query = _queryController.text;
    final description = _descriptionController.text;
    final mediaURL = await _uploadToFirestore();

    final post = {
      'query': query,
      'description': description,
      'mediaURL': mediaURL,
      'createdAt': DateTime.now(),
    };

    // Store the post data in Firestore
    FirebaseFirestore.instance.collection('posts').add(post);

    Navigator.pop(
      context,
      post,
    ); // Return the post data back to the CommunityPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _queryController,
                decoration: const InputDecoration(
                  labelText: 'Write your thoughts....',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Describe your thoughts....',
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: _pickImage,
                    icon: Icon(Icons.image),
                  ),
                  IconButton(
                    onPressed: _pickVideo,
                    icon: Icon(Icons.videocam),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              if (_image != null)
                Image.file(
                  _image!,
                  height: 200,
                )
              else if (_video != null)
                SizedBox(
                  height: 200,
                  child: VideoPlayerWidget(videoFile: _video!),
                ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _post,
                child: const Text('Post'),
              ),
              if (isLoading) const LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;

  const VideoPlayerWidget({required this.videoFile});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
