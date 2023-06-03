import 'package:course_project/screens/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

final now = new DateTime.now();
String formatter = DateFormat('yMd').format(now);

Widget NewCourse(img, text, url, trainerName) {
  return Course(
    img: img,
    text: text,
    url: url,
    trainerName: trainerName,
  );
}

Widget pushNewCourse(coursename, img, url, trainerName) {
  return Course(
    img: img,
    text: coursename,
    url: url,
    trainerName: trainerName,
  );
}

class Course extends StatelessWidget {
  final String img;
  final String text;
  final String url;
  final String trainerName;

  const Course({
    required this.img,
    required this.text,
    required this.url,
    required this.trainerName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.grey[300],
          ),
          width: 330,
          child: Column(
            children: [
              Image.asset(
                img,
                width: 330,
                height: 195,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "$text by $trainerName",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.video_collection,
                      color: Colors.redAccent,
                    ),
                    onTap: () => launch(url),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text("${formatter}"),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<Course> courses = [
  const Course(
    img: "assets/images/Java-Logo.png",
    text: "دورة تعليمية على لغة جافا",
    url: "https://www.youtube.com/watch?v=N1WUJe8GgbM",
    trainerName: "ahmed",
  ),
  const Course(
    img: "assets/images/flutterimg.jpg",
    text: "دورة تدريبية على برنامج Flutter",
    url: "https://www.youtube.com/watch?v=D1Go5WAw6Z0",
    trainerName: "khalid",
  ),
  const Course(
    img: "assets/images/eng.jpg",
    text: "دورة تعليمية على اللغة الأنجليزية",
    url: "https://www.youtube.com/watch?v=WlbXwI_qBBw",
    trainerName: "ahmed",
  ),
  const Course(
    img: "assets/images/adobe.jpg",
    text: "دورة تدريبية في تصميم الجرافيك",
    url: "https://www.youtube.com/watch?v=kOFwIlvGIDQ",
    trainerName: "ahmed",
  ),
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
