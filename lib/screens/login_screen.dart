import 'package:course_project/component/component.dart';
import 'package:course_project/screens/courses_screen.dart';
import 'package:course_project/screens/sign_in_screen.dart';
import 'package:course_project/screens/student_courses_screen.dart';
import 'package:course_project/sqldb.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool? isCanChange = shared.isHaveAccess;

  SqlDb sqlDb = SqlDb();
  List<Map<String, dynamic>> users = [];
  SingInScreen singInScreen = SingInScreen();

  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  bool isShow = true;

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
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
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
          SizedBox(
            height: 40,
          ),
          Container(
            width: 320,
            child: TextField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(),
                label: Text("User name"),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            width: 320,
            child: TextField(
              obscureText: isShow,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  icon: Icon(isShow == false
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                border: OutlineInputBorder(),
                label: Text("Password"),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 50,
            onPressed: () async {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CoursesScreen()),
              // );
              users = await sqlDb.readData(
                  "SELECT * FROM 'users' WHERE username='${usernameController.text}' AND password='${passwordController.text}'");
              if (!users.isEmpty ) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoursesScreen()),
                );
              } 
              // else if (!users.isEmpty && isCanChange == false) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => StudentCoursesScreen()),
              //   );
              // }
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingInScreen()),
              );
            },
            child: Text(
              "Don't have an account ? Sign in",
              style: TextStyle(color: Colors.blue[500]),
            ),
          ),
        ],
      ),
    ));
  }
}
