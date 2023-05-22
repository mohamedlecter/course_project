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
  // const CertificateScreen({super.key});
  int currentValue = 1;

  int maxvalue = courses.length;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/images/1.png"),
    );
  }
}
