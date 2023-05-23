import 'package:course_project/component/component.dart';
import 'package:course_project/screens/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:numberpicker/numberpicker.dart';

class CertificateScreen extends StatefulWidget {
  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  int currentValue = 1;
  int maxvalue = courses.length;

  @override
  Widget build(BuildContext context) {
    String? userName = loggedInName.lName; // Retrieve the user's name
    print(userName);
    return Center(
      child: Stack(
        children: [
          Image.asset("assets/images/1.png"), // Your certificate template image
          Positioned(
            top:
                120, // Adjust the position according to your certificate template
            left:
                170, // Adjust the position according to your certificate template
            child: Text(
              userName!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
