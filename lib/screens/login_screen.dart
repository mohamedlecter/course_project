import 'package:course_project/component/component.dart';
import 'package:course_project/screens/courses_screen.dart';
import 'package:course_project/screens/sign_in_screen.dart';
import 'package:course_project/screens/trainer_courses.dart';
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
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
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
              obscureText: isShow,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
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
                border: const OutlineInputBorder(),
                label: const Text("Password"),
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
              users = await sqlDb.readData(
                  "SELECT * FROM 'users' WHERE username='${usernameController.text}' AND password='${passwordController.text}'");
              if (!users.isEmpty) {
                loggedInName(usernameController.text);
                if (shared.isTrainer == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainerCoursesScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoursesScreen()),
                  );
                }
              }
              if (users.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Account not found'),
                      content: Text(
                          'The account does not exist. Please create a new account.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                            // Add code here to navigate to account creation screen
                          },
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingInScreen()),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(color: Colors.blue[500]),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
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
              "Don't have an account ? Sign up",
              style: TextStyle(color: Colors.blue[500]),
            ),
          ),
        ],
      ),
    ));
  }
}
