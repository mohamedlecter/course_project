import 'dart:io';

import 'package:course_project/component/component.dart';
import 'package:course_project/screens/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewCourseScreen extends StatefulWidget {
  @override
  State<NewCourseScreen> createState() => _NewCourseScreenState();
}

class _NewCourseScreenState extends State<NewCourseScreen> {
  var courseDescriptionController = TextEditingController();
  var urlController = TextEditingController();

  // var CourseDescriptionController = TextEditingController();
  // This is the file that will be used to store the image
  File? image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
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
                      "New course",
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
              height: 70,
            ),
            Container(
              width: 320,
              child: TextField(
                controller: courseDescriptionController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                  label: Text("Course description"),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: 320,
              child: TextField(
                controller: urlController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.link),
                  border: OutlineInputBorder(),
                  label: Text("Link Url"),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _openImagePicker,
              child: Icon(
                image == null ? Icons.image : Icons.done_all,
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.brown[400], // <-- Button color
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              color: Colors.grey[300],
              minWidth: 295,
              height: 50,
              onPressed: () {
                courses.add(pushNewCourse(
                  courseDescriptionController.text,
                  image,
                  urlController.text,
                ));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoursesScreen()),
                );
              },
              child: Text(
                "Add",
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
