import 'package:course_project/component/component.dart';

import 'package:flutter/material.dart';

class StudentCoursesScreen extends StatefulWidget {
  State<StudentCoursesScreen> createState() => _StudentCoursesScreen();
}



class _StudentCoursesScreen extends State<StudentCoursesScreen> {
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
    );
  }
}
