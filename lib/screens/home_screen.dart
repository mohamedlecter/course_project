import 'package:course_project/component/component.dart';
import 'package:course_project/screens/login_screen.dart';
import 'package:flutter/material.dart';

// bool isHeStudent = false;

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Image.asset(
                "assets/images/reading-book.png",
                height: 200,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                width: 180,
                height: 7,
              ),
              SizedBox(
                width: 100,
              ),
              Text(
                "دربني",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 60,
            onPressed: () {
              shared(true);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              "administrator",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 60,
            onPressed: () {
              shared(true);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              "trainer",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 60,
            onPressed: () {
              shared(false);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              "student",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
