import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TextAnalyzer extends StatefulWidget {
  const TextAnalyzer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextAnalyzerState createState() => _TextAnalyzerState();
}

class _TextAnalyzerState extends State<TextAnalyzer> {
  final TextEditingController _textController = TextEditingController();
  String _analysisResult = '';

  Future<void> _analyzeText(String text) async {
    const String endpoint = 'https://cec0-154-236-188-162.ngrok-free.app/predict'; // Use your machine's IP address
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {'text': text};

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        setState(() {
          _analysisResult = jsonDecode(response.body)['predicted_emotion'];
        });
      } else {
        throw Exception('Failed to analyze text');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Analyzer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String text = _textController.text;
                _analyzeText(text);
              },
              child: const Text('Analyze'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Analysis Result: $_analysisResult',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

