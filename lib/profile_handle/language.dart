import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  final List<String> languages = [
    'English',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Turkish'
  ];

  final List flags = [
    FlagsCode.US,
    FlagsCode.FR,
    FlagsCode.GR,
    FlagsCode.CH,
    FlagsCode.JP,
    FlagsCode.TR
  ];

   LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Language',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Select a Language',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flag.fromCode(
                          flags[index],
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        languages[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Icon(headicons[index], color: Colors.black)