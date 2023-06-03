import 'package:course_project/component/component.dart';
import 'package:course_project/screens/courses_screen.dart';
import 'package:course_project/screens/login_screen.dart';
import 'package:course_project/screens/new_course_screen.dart';
import 'package:course_project/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class SingInScreen extends StatelessWidget {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  // const SingInScreen({super.key});
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Image.asset(
                "assets/images/dating-app.png",
                height: 200,
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    width: 180,
                    height: 7,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 320,
            child: TextField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(),
                label: Text("User name"),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            width: 320,
            child: TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                label: Text("Password"),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 50,
            onPressed: () async {
              int reposnse = await sqlDb.insertData(
                  'INSERT INTO users(username,password) VALUES ("${usernameController.text}","${passwordController.text}")');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text(
              "Sign in",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ),
        ],
      ),
    ));
  }
}
