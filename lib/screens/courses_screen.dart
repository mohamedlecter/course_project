import 'package:course_project/component/component.dart';
import 'package:course_project/screens/certificate_screen.dart';
import 'package:course_project/screens/delete_courses.dart';
import 'package:course_project/screens/login_screen.dart';
import 'package:course_project/screens/new_course_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  Widget? BuildCourse(index) {
    return courses[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return BuildCourse(index);
          },
          itemCount: courses.length,
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
                  if (shared.isHaveAccess == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeleteScreen()),
                    );
                  }
                },
                icon: Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
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
                          builder: (context) => NewCourseScreen()),
                    );
                  }
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
              ),
              child: IconButton(
                onPressed: () {
                  // AwesomeDialog(
                  //     context: context,
                  //     dialogType: DialogType.success,
                  //     animType: AnimType.rightSlide,

                  //     title: 'Congratulations !',

                  //     // desc: '${}',

                  //     btnOkOnPress: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => CoursesScreen()),
                  //       );
                  //     },
                  //     btnOkText: "Okay")
                  //   ..show();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CertificateScreen()),
                  );
                },
                icon: Icon(
                  Icons.task,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
