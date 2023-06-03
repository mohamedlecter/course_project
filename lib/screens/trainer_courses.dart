import 'package:course_project/component/component.dart';
import 'package:course_project/screens/certificate_screen.dart';
import 'package:course_project/screens/delete_courses.dart';
import 'package:course_project/screens/delete_trianer_courses.dart';
import 'package:course_project/screens/login_screen.dart';
import 'package:course_project/screens/new_course_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainerCoursesScreen extends StatefulWidget {
  State<TrainerCoursesScreen> createState() => _TrainerCoursesScreenState();
}

class _TrainerCoursesScreenState extends State<TrainerCoursesScreen> {
  List<Course> trainerCourses = [];

  @override
  void initState() {
    super.initState();
    // Filter the courses list by trainer name
    trainerCourses = courses
        .where((course) => course.trainerName == loggedInName.lName)
        .toList();
  }

  Widget buildCourse(int index) {
    return trainerCourses[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return buildCourse(index);
        },
        itemCount: trainerCourses.length,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: IconButton(
              onPressed: () {
                print(loggedInName.lName);
                if (shared.isHaveAccess == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeleteTrainerCoursesScreen()),
                  );
                }
              },
              icon: const Icon(
                Icons.delete,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: IconButton(
              onPressed: () {
                if (shared.isHaveAccess == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewCourseScreen(),
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue,
            ),
            child: IconButton(
              onPressed: () {
                print(shared.isTrainer);
                if (shared.isTrainer == false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CertificateScreen()),
                  );
                }
              },
              icon: const Icon(
                Icons.task,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
