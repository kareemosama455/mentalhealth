import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/background.dart';
import 'verifymodel.dart';
// ignore: camel_case_types
class verify_screen extends StatefulWidget {
  const verify_screen({super.key});

  

  @override
  // ignore: library_private_types_in_public_api
  _verify_screen createState() => _verify_screen();
}

// ignore: camel_case_types
class _verify_screen extends State<verify_screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
  backgroundColor: Colors.white,
  body: SingleChildScrollView(
   child: Column(
   children: <Widget>[
   MyBackground(),
     SizedBox(height: 2000,child: VerifyModel(),)
    
  ],
  
  ),
  ));
  }
}