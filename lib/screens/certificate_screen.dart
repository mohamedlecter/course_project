import 'package:course_project/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:numberpicker/numberpicker.dart';

class CertificateScreen extends StatefulWidget {
  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  int currentValue = 1;
  int maxvalue = courses.length;
  TextEditingController nameController = TextEditingController();
  bool showCertificate = false;
  late String courseName = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: showCertificate
            ? Stack(
                children: [
                  Image.asset(
                      "assets/images/2.png"), // Your certificate template image
                  Positioned(
                    top:
                        125, // Adjust the position of the user name on the certificate
                    left:
                        180, // Adjust the position of the user name on the certificate
                    child: Text(
                      nameController.text,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top:
                        150, // Adjust the position according to your certificate template
                    left:
                        130, // Adjust the position according to your certificate template
                    child: Text(
                      courseName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Choose course number",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  NumberPicker(
                    value: currentValue,
                    minValue: 1,
                    maxValue: maxvalue,
                    onChanged: (value) => setState(() => currentValue = value),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Enter the name you want the certificate to be given to:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Name",
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        courseName = courses[currentValue - 1].text;
                        showCertificate = true;
                      });
                    },
                    child: const Text("Generate Certificate"),
                  ),
                ],
              ),
      ),
    );
  }
}
