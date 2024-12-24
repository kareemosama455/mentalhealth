import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Widget?> screens = [null, null];
  final List<IconData> headIcons = [Icons.language, Icons.settings];
  final List<String> profileText = ['Language Settings', 'Settings'];
  String? myEmail;
  String? myFirstName;
  String? myLastName;
  File? file;
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        DocumentSnapshot ds = await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .get();
        Map<String, dynamic>? data = ds.data() as Map<String, dynamic>?;
        if (data != null) {
          setState(() {
            myEmail = data['email'];
            myFirstName = data['first_name'];
            myLastName = data['last_name'];
            imageUrl = data['profile_pic']; // Fetch the image URL
          });
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _getData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      var imagename = basename(image.path);
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        var refstorage = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(firebaseUser.uid)
            .child(imagename);
        await refstorage.putFile(file!);
        String downloadUrl = await refstorage.getDownloadURL();

        // Update Firestore with the new profile picture URL
        await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .update({'profile_pic': downloadUrl});

        setState(() {
          imageUrl = downloadUrl; // Update the local state with the new URL
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
                      child: imageUrl == null ? const Icon(Icons.person, size: 50) : null,
                    ),
                    IconButton(
                      color: Colors.purple,
                      onPressed: _getData,
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (myEmail == null || myFirstName == null || myLastName == null)
                  const Text("Loading data... Please wait")
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Email: $myEmail",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              myFirstName!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              myLastName!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profileText.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          profileText[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                        leading: Icon(headIcons[index], color: Colors.black),
                        trailing: const Icon(Icons.arrow_forward, color: Colors.black),
                        onTap: () {
                          if (screens[index] != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => screens[index]!),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
