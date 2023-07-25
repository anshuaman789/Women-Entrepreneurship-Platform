import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:wep_project/common/methodsfile.dart';

import './common/widgetslib.dart';
import 'home/home.dart';

List<Color> pinkGradient = [
  Colors.pink[700]!,
  Colors.pink[600]!,
  Colors.pink[500]!,
  Colors.pink[400]!,
  Colors.pink[400]!,
  Colors.pink[300]!,
  Colors.pink[300]!,
  Colors.pink[200]!,
  Colors.pink[200]!,
];
List<Color> tealradient = [
  Colors.teal[600]!,
  Colors.teal[600]!,
  Colors.teal[500]!,
  Colors.teal[500]!,
  Colors.teal[400]!,
  Colors.teal[300]!,
  Colors.teal[300]!,
  Colors.teal[200]!,
  Colors.teal[200]!,
];
List<Color> purpleGradient = [
  Colors.purple[700]!,
  Colors.purple[600]!,
  Colors.purple[500]!,
  Colors.purple[500]!,
  Colors.purple[400]!,
  Colors.purple[400]!,
  Colors.purple[300]!,
  Colors.purple[200]!,
  Colors.purple[200]!,
];

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Splash Screens',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreens(),
//     );
//   }
// }

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  final PageController _controller = PageController(initialPage: 0);
  double _currentPage = 0;

  final List<String> imagePaths = [
    'assets/images/splashScreen1.jpg',
    'assets/images/splashScreen2.jpg',
    'assets/images/splashScreen3.jpg',
  ];

  final List<List<Color>> pageColors = [
    pinkGradient,

    purpleGradient,
    tealradient,
    // Colors.pink.shade100,
    // Colors.teal.shade100,
    // Colors.purple.shade100,
  ];

  final List<String> titles = [
    'Partners',
    'Community',
    'Smart Match',
  ];

  final List<String> descriptions = [
    'Be our Partner and join us on the mission to empower women entrepreneur. ',
    'Enjoy benefits of being a part of a large community!',
    'AI based matching of seeker and providers! .',
  ];

  final List<String> shortdesc = [
    'Find suitable partners',
    'Join the WEP community',
    'AI powered matchmaking!',
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return SplashPage(
                imagePath: imagePaths[index],
                pageColor: pageColors[index],
                title: titles[index],
                description: descriptions[index],
                shortdesc: shortdesc[index],
                pageno: index,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: DotsIndicator(
                dotsCount: imagePaths.length,
                position: _currentPage.toInt(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  activeColor: Colors.white,
                  color: Colors.white54,
                ),
              ),
            ),
          ),
          if (_currentPage != 2)
            Positioned(
              top: 50.0,
              right: 20.0,
              child: TextButton(
                onPressed: () {
                  callClass(context, HomePage());
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          if (_currentPage != 0)
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: IconButton(
                onPressed: () {
                  if (_currentPage > 0) {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
            ),
          if (_currentPage != imagePaths.length - 1)
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: IconButton(
                onPressed: () {
                  if (_currentPage < imagePaths.length - 1) {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  final String imagePath;
  final List<Color> pageColor;
  final String title;
  final String description;
  final int pageno;
  final String shortdesc;

  SplashPage({
    required this.imagePath,
    required this.pageColor,
    required this.title,
    required this.description,
    required this.pageno,
    required this.shortdesc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: pageColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(65 * 3.1415927 / 180),
        ),
      ), // 45 degrees in radians
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 250.0,
            height: 250.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 80.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                shortdesc,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.0),
          Visibility(
            visible: this.pageno == 2, // 2 = last page or the third  0,1,2
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                callClass(context, HomePage());
              },
              child: Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}
