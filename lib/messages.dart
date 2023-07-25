import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  String _messageText = '';

  @override
  void initState() {
    super.initState();

    // Request permission and handle initial message
    _initializeMessaging();
  }

  void _initializeMessaging() async {
    NotificationSettings settings = await _messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined permission or permissions are not available');
    }

    // Handle initial message if the app was opened from a notification
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Listen for incoming messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
    });
  }

  void _handleMessage(RemoteMessage message) {
    print('Received message: ${message.data}');

    setState(() {
      _messageText = message.data['message'] ?? '';
    });

    // Perform actions based on the message data
    // You can customize this logic based on your specific requirements
    if (message.data['action'] == 'open_screen1') {
      // Navigate to Screen 1
      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()));
    } else if (message.data['action'] == 'open_screen2') {
      // Navigate to Screen 2
      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
    } else {
      // Default action
      // Example: Do something else
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCM Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FCM Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Received Message:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                _messageText,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
