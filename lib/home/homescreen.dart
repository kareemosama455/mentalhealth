import 'package:flutter/material.dart';
import 'package:flutter_application_1/AIscreens/photoanalysis/photoscreen.dart';
import 'package:flutter_application_1/AIscreens/textscreen.dart';
import 'package:flutter_application_1/AIscreens/videoscreen.dart';
import 'package:camera/camera.dart';

class UserModel {
  final int id;
  final String name;
  final String description1;
  final String url;

  UserModel({
    required this.id,
    required this.name,
    required this.description1,
    required this.url,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<CameraDescription>> _camerasFuture;

  @override
  void initState() {
    super.initState();
    _camerasFuture = availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CameraDescription>>(
        future: _camerasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child:  CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final cameras = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) => buildUserItem(context, users[index], cameras),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: users.length,
            );
          }
        },
      ),
    );
  }

  Widget buildUserItem(BuildContext context, UserModel user, List<CameraDescription> cameras) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Image.asset(
          user.url,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(user.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.description1,
              maxLines: 4, // Limit text to 4 lines
              overflow: TextOverflow.ellipsis, // Show ellipsis if text exceeds 4 lines
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () => navigateToScreen(context, user.id, cameras),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            minimumSize: const Size(30, 10),
          ),
          child: Text(
            "Start With ${user.name}",
            style: const TextStyle(fontSize: 8),
          ),
        ),
      ),
    );
  }

  void navigateToScreen(BuildContext context, int userId, List<CameraDescription> cameras) {
    switch (userId) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => EmotionDetectionApp(cameras: cameras)),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TextAnalyzer()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>  const EmojiClassifier()),
        );
        break;
      // Add more cases for additional screens if needed
    }
  }
}

final List<UserModel> users = [
  UserModel(
    id: 1,
    name: 'Video Analyst',
    description1: 'Use psychologically valid models of facial movement',
    url: 'assets/images/WhatsApp Image 2024-03-06 at 00.57.53_0d7a668e.jpg',
  ),
  UserModel(
    id: 2,
    name: 'Writing Analyst',
    description1: 'Use custom words that understand expression and language',
    url: 'assets/images/WhatsApp Image 2024-03-06 at 00.57.53_75fdfb28.jpg',
  ),
  UserModel(
    id: 3,
    name: 'Photo Analyst',
    description1: 'Analyze photos',
    url: 'assets/images/WhatsApp Image 2024-03-06 at 00.57.53_0d7a668e.jpg',
  ),
];
