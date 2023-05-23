import 'package:course_project/screens/courses_screen.dart';
import 'package:course_project/screens/student_courses_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

final now = new DateTime.now();
String formatter = DateFormat('yMd').format(now);

Widget NewCourse(img, text, url, trainerName) {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey[300],
        ),
        width: 330,
        child: Column(children: [
          Image.asset(
            "$img",
            width: 330,
            height: 195,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("$text by $trainerName",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 4,
                itemSize: 25,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child: Icon(
                  Icons.video_collection,
                  color: Colors.redAccent,
                ),
                onTap: () => launch(url),
              ),
              // IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.assignment_turned_in,
              //       color: Colors.green,
              //     )),
              SizedBox(
                width: 50,
              ),
              Text("${formatter}"),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ]),
      ),
    ],
  );
}

Widget pushNewCourse(coursename, img, url, trainerName) {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey[300],
        ),
        width: 320,
        child: Column(children: [
          Image.file(
            img!,
            fit: BoxFit.cover,
            width: 330,
            height: 195,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("$coursename by $trainerName",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 4,
                itemSize: 25,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child: Icon(
                  Icons.video_collection,
                  color: Colors.redAccent,
                ),
                onTap: () => launch(url),
              ),
              SizedBox(
                width: 30,
              ),
              Text("${formatter}"),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ]),
      ),
    ],
  );
}

List<Widget> courses = [
  NewCourse("assets/images/Java-Logo.png", "دورة تعليمية على لغة جافا",
      "https://www.youtube.com/watch?v=N1WUJe8GgbM", "mohamed"),
  NewCourse("assets/images/flutterimg.jpg", "دورة تدريبية على برنامج Flutter",
      "https://www.youtube.com/watch?v=D1Go5WAw6Z0", "mohamed"),
  NewCourse("assets/images/eng.jpg", "دورة تعليمية على اللغة الأنجليزية",
      "https://www.youtube.com/watch?v=WlbXwI_qBBw", "mohamed"),
  NewCourse("assets/images/adobe.jpg", "دورة تدريبية في تصميم الجرافيك",
      "https://www.youtube.com/watch?v=kOFwIlvGIDQ", "ahmed"),
];

class shared {
  static bool? isHaveAccess;
  static bool? isTrainer;

  shared(bool isHaveAccess, bool isTrainer) {
    shared.isHaveAccess = isHaveAccess;
    shared.isTrainer = isTrainer;
  }
}

class loggedInName {
  static String? lName;

  loggedInName(String lName) {
    loggedInName.lName = lName;
  }
}
