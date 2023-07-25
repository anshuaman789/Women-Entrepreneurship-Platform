import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'partners/partneradd.dart';
import 'partners/partners.dart';
import './aboutus.dart';
import './connect.dart';
import './disclaimer.dart';
import './feedback/feedback.dart';
import './common/mapaddress.dart';
import 'common/variables.dart';
import 'home/home.dart';
import './splashscreen.dart';
import './faq/faq.dart';
import './indulge/credits.dart';
import 'general/events.dart';
import 'general/profilepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(WEPApp());
}

class WEPApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WEP App',
      theme: ThemeData(
        primarySwatch: myCustomColor,
        colorScheme: myColorScheme,
      ),
      initialRoute: '/',
      routes: {
//        '/': (context) => HomePage(),
        '/': (context) => SplashScreens(),
        '/partners': (context) => Partners(),
        '/partnersadd': (context) => PartnersAdd(),
        '/aboutus': (context) => AboutUs(),
        '/feedback': (context) => Feedbacks(),
        '/mapaddress': (context) => MapAddress(),
        '/faq': (context) => FaqPage(),
        '/credits': (context) => Credits(),

        '/connect': (context) => ConnectWithUs(),
        '/disclaimer': (context) => Disclaimer(),
        '/events': (context) => EventsPage(),
      },
    );
  }
}
