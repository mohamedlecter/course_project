import 'package:course_project/component/component.dart';
import 'package:course_project/screens/trainer_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:numberpicker/numberpicker.dart';

class DeleteTrainerCoursesScreen extends StatefulWidget {
  @override
  State<DeleteTrainerCoursesScreen> createState() =>
      _DeleteTrainerCoursesScreenState();
}

class _DeleteTrainerCoursesScreenState
    extends State<DeleteTrainerCoursesScreen> {
  int currentValue = 1;

  late List<Course> trainerCourses;

  int maxvalue = 1; // List to store courses added by the trainer

  @override
  void initState() {
    super.initState();
    trainerCourses =
        getCoursesByTrainer(); // Retrieve courses added by the trainer
    maxvalue = trainerCourses.length;
  }

  List<Course> getCoursesByTrainer() {
    return courses
        .where((course) => course.trainerName == loggedInName.lName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
            MaterialButton(
              color: Colors.grey[300],
              minWidth: 295,
              height: 50,
              onPressed: () {
                if (trainerCourses.isNotEmpty) {
                  int index = currentValue - 1;
                  Course course = trainerCourses[index];
                  courses.remove(course);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainerCoursesScreen()),
                  );
                }
              },
              child: const Text(
                "Delete!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
