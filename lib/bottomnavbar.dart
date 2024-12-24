import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Exam/exams.dart';
import 'home/homescreen.dart';
import 'profile_handle/profile_screen.dart';
import 'package:get/get.dart';


class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int index = 0;
  final pages = [
     const Center(child: HomeScreen()),
    const Center(child: ExamScreen()),
     const Center(child: ProfileScreen()),
  ];
 final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
        title: const Text('Mental Health'),
        actions: [
          IconButton(
              onPressed: () async {
                // Disable persistence on web platforms
        await FirebaseAuth.instance.signOut();                // ignore: use_build_context_synchronously
                // ignore: use_build_context_synchronously
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('login', (route) => false);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Obx(() {
        switch (homeController.selectedIndex.value) {
          case 0:
            return  const HomeScreen();
          case 1:
            return const ExamScreen();
          case 2:
            return const ProfileScreen();
          default:
            return  const HomeScreen();
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'exam',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}