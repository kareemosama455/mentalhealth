import 'package:flutter/material.dart';

// ignore: camel_case_types
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

// ignore: camel_case_types
class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            'Edit Profile',
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
          backgroundColor: Colors.white),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [Center(
              child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/WhatsApp Image 2024-03-06 at 00.38.58_53d09198.jpg'),
                    radius: 50,
                  ),
                ),
                IconButton(
                    color: const Color.fromRGBO(143, 148, 251, 1),
                    onPressed: () {},
                    icon: const Icon(Icons.camera))
              ],
                      ),
            ),
            Container(margin: const EdgeInsets.all(10),height: 50,width: 300,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Name',
                    labelText: 'Name',
                    border: OutlineInputBorder()),
              ),
            ),
            Container(margin: const EdgeInsets.all(10),height: 50,width: 300,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    border: OutlineInputBorder()),
              ),
            ),Container(margin: const EdgeInsets.all(10),height: 50,width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Phone',
                    labelText: 'Phone Number',
                    border: OutlineInputBorder()),
              ),
            ),
            Container(margin: const EdgeInsets.all(10),height: 50,width: 300,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                   focusColor: Colors.deepPurple,
                    hintText: 'Enter Your Country',
                    labelText: 'Country',
                    border: OutlineInputBorder()),
              ),
            ),Container(
            width: 400,
            height: 60,
            margin: const EdgeInsets.all(20),
            color: Colors.blue,
            child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(const Color.fromRGBO(143, 148, 251, 1))),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                )),
          )],
          ),
    );
  }
}
