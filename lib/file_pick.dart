// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Picker and TFLite Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ImagePickerScreen(),
//     );
//   }
// }

// class ImagePickerScreen extends StatefulWidget {
//   const ImagePickerScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ImagePickerScreenState createState() => _ImagePickerScreenState();
// }

// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   File? _image;
//   String? _result;
//   Interpreter? _interpreter;

//   @override
//   void initState() {
//     super.initState();
//     _loadModel();
//   }

//   Future<void> _loadModel() async {
//     _interpreter = await Interpreter.fromAsset('assets/aimodels/model.tflite');
//     setState(() {});  // Ensure the state is updated after the interpreter is loaded
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//       if (_interpreter != null) {
//         await _analyzeImage(_image!);
//       } else {
//         if (kDebugMode) {
//           print('Interpreter is not initialized');
//         }
//       }
//     }
//   }

//   Future<void> _analyzeImage(File image) async {
//     // Ensure the interpreter is initialized
//     if (_interpreter == null) {
//       if (kDebugMode) {
//         print('Interpreter is not initialized');
//       }
//       return;
//     }

//     // Load image as TensorImage
//     var inputImage = TensorImage.fromFile(image);
    
//     // Preprocess the image
//     var imageProcessor = ImageProcessorBuilder()
//         .add(ResizeOp(224, 224, ResizeMethod.NEAREST_NEIGHBOUR))
//         .add(NormalizeOp(0, 255))
//         .build();
//     inputImage = imageProcessor.process(inputImage);

//     // Prepare output buffer
//     var output = TensorBuffer.createFixedSize(<int>[1, 1001], TfLiteType.float32);

//     // Run inference
//     _interpreter!.run(inputImage.buffer, output.buffer);

//     // Process the output and get the result
//     setState(() {
//       _result = output.getDoubleList().toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pick and Analyze Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? const Text('No image selected.')
//                 : Image.file(_image!),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: const Text('Pick Image'),
//             ),
//             const SizedBox(height: 20),
//             _result == null
//                 ? const Text('No result')
//                 : Text('Result: $_result'),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _interpreter?.close();
//     super.dispose();
//   }
// }
