import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './common/widgetslib.dart';
import './feedback/feedback.dart';

class ConnectWithUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect with Us'),
      ),
      body:
      Column(
        children: [
          Expanded(
              child: Container(

      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Heading(
                  "Connect with Us", Colors.blueGrey, 36.0, FontWeight.bold
              ),

              buildParagraph(165, 380,
                  'Welcome to Women Entrepreneurship Platform (WEP), where connection and community thrive! Stay connected with us to discover the latest updates, exciting events, news and engaging content. Join our vibrant online community and be part of something extraordinary! Join now:',
                  10,14),
              buildSocialConnection('Twitter', 'https://twitter.com/NITIAayog', Colors.blue, FontAwesomeIcons.twitter),
              buildSocialConnection('Facebook', 'https://www.facebook.com/WomenEntrepreneurshipPlatform/', Colors.blue,FontAwesomeIcons.facebook),
              buildSocialConnection('LinkedIn', 'https://www.linkedin.com/company/women-entrepreneurship-platform-niti-aayog/', Colors.blue,FontAwesomeIcons.linkedinIn),
              buildSocialConnection('YouTube', 'https://www.youtube.com/watch?v=UFJeTwHh01w', Colors.red,FontAwesomeIcons.youtube),
              buildParagraph(290, 380,
                  'By following our social media channels, you\'ll gain VIP access to a world of inspiration, knowledge, and entertainment. Experience exclusive content, behind-the-scenes peeks, thought-provoking discussions, and captivating stories. Be the first to know about exciting opportunities, contests, and special promotions.'+
                  'We cherish the connections we build with our incredible community. Engage with us, ask questions, share your stories, and connect with like-minded individuals who share your passions. Together, let\'s create unforgettable moments and make a positive impact!'+
                  'Join us today and let the journey begin!',
                  12,14),

      ],),
    ),),
    /////////////////////////////////////////
    ),
    ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.purple[50],
              child: Footer(context, Icons.home, Icons.explore, Icons.abc, Icons.person, Feedbacks(), Feedbacks(), Feedbacks(), Feedbacks()),
            ),
          ),
        ],
      ),

      ////////////////////////////////////////
    );
  }
}
