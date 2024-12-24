import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/loginscreen.dart';
import 'package:flutter_application_1/auth/signup.dart';
import 'package:flutter_application_1/bottomnavbar.dart';
import 'package:flutter_application_1/home/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/verify/verifyscreen.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 @override
  void initState() {
    super.initState();
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('==========User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('==========================User is signed in!');
      }
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,home:FirebaseAuth.instance.currentUser==null ? const LoginScreen():const Bottomnavbar(),
    routes: {
      'signup':(context) => const SignupScreen(),
'login':(context) => const LoginScreen(),
'homescreen':(context) =>  const HomeScreen(),
'verify':(context) => const verify_screen(),
'navbar':(context) => const Bottomnavbar(),

    },);
  }
}


