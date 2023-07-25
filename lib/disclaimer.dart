import 'package:flutter/material.dart';

import './common/widgetslib.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../feedback/feedback.dart';

class Disclaimer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text('Disclaimer')
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
    "Disclaimer", Colors.blueGrey, 36.0, FontWeight.bold
    ),

    buildParagraph(129  , 380,
        'Though all efforts have been made to ensure the accuracy of the contents on this portal, the same should not be construed as accurate reproduction of the text for use for any legal purposes.',
    10,16),
    buildParagraph(105, 380,
        'NITI Aayog and NIC accept no liability or responsibility in relation to the accuracy, completeness, usefulness or otherwise, of the contents.',
        10,16),

      buildParagraph(195, 380,
          'In no event, NITI Aayog or NIC will be liable for any loss, damage, liability or expense incurred or suffered that is claimed to have resulted from use of this portal, including, without limitation, any fault, virus, error, omission, interruption or delay, with respect thereto, direct, indirect or remote.',
          10,16),

      buildParagraph(175, 380,
          'The use of app is at the user\'s sole risk. User specifically acknowledges and agrees that NITI Aayog and NIC are not liable for any conduct of any user. Links to other websites that have been included on this portal are provided for public convenience only.',
          10,16),

      buildParagraph(125, 380,
          'However, NITI Aayog or NIC is not responsible for the contents or reliability of linked websites and does not necessarily endorse the views expressed therein.',
          10,16),
      buildParagraph(150, 380,
          'NITI Aayog or NIC also does not affirm or guarantee the availability of such linked pages at all times. Any disputes arising out of these terms and conditions, shall be subject to the exclusive jurisdiction of the courts of Delhi.',
          10,16),
      buildParagraph(220, 380,
          'Automated translations from English to Indian languages on this website are provisioned and may not be precise. Some content including text, applications, graphics and documents may not get translated. Automated translation tools work well on Chrome and Mozilla Firefox browsers.',
          10,16),


    ],),
    ),),      //     child: Column(

      ////////////////////////////////////////////////////
    ),),
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
      /////////////////////////////////////////////////////
    );
  }
}