
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Exam/eysenk.dart';
import 'package:flutter_application_1/exam/ADHD.dart';
import 'package:flutter_application_1/exam/depression.dart';
import 'package:flutter_application_1/exam/obsessive.dart';
import 'package:flutter_application_1/exam/tensi.dart';

class UserModel {
  final int id;
  final String name;
  final String url;

  UserModel({
    required this.id,
    required this.name,
    required this.url,
  });
}


class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) => buildUserItem(context, users[index]),
        itemCount: users.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}

Widget buildUserItem(BuildContext context, UserModel user) {
  return InkWell(
    onTap: () => navigateToScreen(context, user.id),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              user.url,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  user.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  void navigateToScreen(BuildContext context, int userId) {
  switch (userId) {
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (_) => const EysenkScreen()));
      break;
    case 2:
      Navigator.push(context, MaterialPageRoute(builder: (_) =>const ADHDScreen() ));
      break;
    case 3:
      Navigator.push(context, MaterialPageRoute(builder: (_) => const DepressionScreen()));
      break;
      case 4:
      Navigator.push(context, MaterialPageRoute(builder: (_) =>  const ObsessiveScreen()));
      break;
      case 5:
      Navigator.push(context, MaterialPageRoute(builder: (_) =>  const TensiScale()));
      break;
  }
}
final List<UserModel> users = [
  UserModel(
    id: 1,
    name: 'Eysenck Inventory',
    url: 'assets/images/OIP (2).jpeg',
  ),
  UserModel(
    id: 2,
    name: 'ADHD',
    url: 'assets/images/OIP (1).jpeg',
  ),
  UserModel(
    id: 3,
    name: 'depression',
    url: 'assets/images/360_F_252778425_8oXcIfDMZvo0PgInk6GMl9u0sV2BPQBN.jpg',
  ),
  UserModel(
    id: 4,
    name: 'Obsessive Compulsive',
    url:'assets/images/OIP.jpeg'
     ,
  ),
  UserModel(
    id: 5,
    name: 'Tensi scale',
    url: 'assets/images/istockphoto-152407474-612x612.jpg',
  ),
];
  

