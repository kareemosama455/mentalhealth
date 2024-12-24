import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const EmojiClassifier(),
    );
  }
}

class EmojiClassifier extends StatefulWidget {
  const EmojiClassifier({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmojiClassifierState createState() => _EmojiClassifierState();
}

class _EmojiClassifierState extends State<EmojiClassifier> {
  File? _imageFile;
  List? _identifiedResult;
  @override
  void initState() {
    super.initState();
    loadEmojiModel();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future selectImage() async {
    final picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery, maxHeight: 300);
    identifyImage(image);
  }

  Future loadEmojiModel() async {
    Tflite.close();
    String result;
    result = (await Tflite.loadModel(
      model: "assets/videomodel/ferNet.tflite",
      labels: "assets/videomodel/ferNet_labels.txt",
    ))!;
    if (kDebugMode) {
      print(result);
    }
  }

  Future identifyImage(image) async {
    _identifiedResult = null;
    // Run tensorflowlite image classification model on the image
    if (kDebugMode) {
      print("classification start $image");
    }
    final List? result = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0, 
      imageStd: 255.0, 
      numResults: 2, 
      threshold: 0.2, 
      asynch: true
    );
    if (kDebugMode) {
      print("classification done");
    }
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
        _identifiedResult = result;
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Emoji Classifier",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(color: Colors.white),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(2, 2),
                      spreadRadius: 2,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: (_imageFile != null)?
                Image.file(_imageFile!) :
                Image.network('https://i.imgur.com/sUFH1Aq.png')
              ),
              FloatingActionButton(
                tooltip: 'Select Image',
                onPressed: (){
                  selectImage();
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.add_a_photo,
                size: 25,
                color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Column(
                  children: _identifiedResult != null ? [
                    const Text(
                      "Result : ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    Card(
                        elevation: 1.0,
                        color: Colors.white,
                        child: Container(
                          width: 100,
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              "${_identifiedResult?[0]["label"]}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      )
                    ]
                  :[]
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
