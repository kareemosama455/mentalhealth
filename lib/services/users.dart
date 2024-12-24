import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile_handle/profile_screen.dart';

class UserManagement {
  storeNewUser(user,String firstName, String lastName, context) async {
    var firebaseUser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance.collection('users')
        .doc(firebaseUser.uid)
        .set({'email': user.email,
        'uid': user.uid,
        'first_name': firstName,
        'last_name': lastName
        },
        )

        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ProfileScreen())))
        .catchError((e) {
          if (kDebugMode) {
            print(e);
          }
        });
  }
}

