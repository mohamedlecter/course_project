import 'package:course_project/component/component.dart';
import 'package:course_project/screens/login_screen.dart';
import 'package:course_project/screens/trainerLogin.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
              const SizedBox(
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
              const SizedBox(
                width: 100,
              ),
              const Text(
                "دربني",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 60,
            onPressed: () {
              shared(true, false);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text(
              "administrator",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 60,
            onPressed: () {
              shared(true, true);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TarinerLogIn()),
              );
            },
            child: const Text(
              "trainer",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 60,
            onPressed: () {
              shared(false, false);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text(
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
