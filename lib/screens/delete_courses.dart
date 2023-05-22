import 'package:course_project/component/component.dart';
import 'package:course_project/screens/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:numberpicker/numberpicker.dart';

class DeleteScreen extends StatefulWidget {
  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  // const DeleteScreen({super.key});
  int currentValue = 1;
  int maxvalue = courses.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Choose course number",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          NumberPicker(
            value: currentValue,
            minValue: 1,
            maxValue: maxvalue,
            onChanged: (value) => setState(() => currentValue = value),
          ),
          SizedBox(
            height: 100,
          ),
          MaterialButton(
            color: Colors.grey[300],
            minWidth: 295,
            height: 50,
            onPressed: () {
              courses.removeAt(currentValue - 1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesScreen()),
              );
            },
            child: Text(
              "Delete !",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}


// Container(
//               width: 320,
//               child: TextField(
//                 controller: IndexOfCourse,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.link),
//                   border: OutlineInputBorder(),
//                   label: Text("Link Url"),
//                 ),
//               ),
//             ),



