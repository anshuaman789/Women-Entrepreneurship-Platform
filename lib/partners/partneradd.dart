import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../home/home.dart';
import '../common/variables.dart';
import '../common/widgetslib.dart';
import '../feedback/feedback.dart';

class PartnersAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partners'),
      ),
      body:
      Column(
        children: [
      Expanded(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Heading("Apply for Partnership"+wF.toString(), Colors.blueGrey, 36.0*wF, FontWeight.bold),
          Container(
            height: 100*hF,
            color: Colors.purple[100],
            padding: EdgeInsets.only(left: 6.0*wF, right: 6.0*wF, top: 20.0*hF, bottom: 6.0*hF),
            margin: EdgeInsets.only(left: 10*wF, right: 10.0*wF, top:20.0*hF),
            child: Text('Want to power the success of the inspiring women?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0*wF,
                  fontWeight: FontWeight.normal,
                )),
          ),


          Container(
            height: 40.0*hF,
            margin: EdgeInsets.only(top: 10.0*hF, left: 8.0*wF),
            padding: EdgeInsets.only(top: 10.0*hF, left: 6.0*wF),
            child: ElevatedButton(
              onPressed: () {
//               Navigator.pushNamed(context, '/GoogleFormScreen');
               //  SizedBox(width: 500, height: 400);
                 launchUrlString('https://docs.google.com/forms/d/e/1FAIpQLSdmviQi_CkEeo1vRnKLjC3K80cuhQeE41paXOUal6Qg2pp2rQ/formResponse');
              },


              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo.shade300),
                minimumSize: MaterialStateProperty.all<Size>(Size(100.0*hF, 50.0*wF)),
              ),
              child: Text('Apply'),
            ),
          ),

// Insert here
        ],
      ),),
    Align(
    alignment: Alignment.bottomCenter,
    child: Container(
    padding: EdgeInsets.all(5.0),
    color: Colors.purple[50],
    child: Footer(context, Icons.home, Icons.explore, Icons.abc, Icons.person, Feedbacks(), Feedbacks(), Feedbacks(), Feedbacks()),
    ),),

        ],
      ///////////////////////////
    ),
      ////////////////////////
    );
  }
}
