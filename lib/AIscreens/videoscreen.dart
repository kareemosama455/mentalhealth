import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(EmotionDetectionApp(cameras: cameras));
}

class EmotionDetectionApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const EmotionDetectionApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotion Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmotionDetectionPage(cameras: cameras),
    );
  }
}

class EmotionDetectionPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const EmotionDetectionPage({super.key, required this.cameras});

  @override
  // ignore: library_private_types_in_public_api
  _EmotionDetectionPageState createState() => _EmotionDetectionPageState();
}

class _EmotionDetectionPageState extends State<EmotionDetectionPage> {
  CameraController? _controller;
  WebSocketChannel? _channel;
  String _emotion = "Detected Emotion: None";
  Timer? _frameCaptureTimer;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.medium,
    );
    await _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    _frameCaptureTimer?.cancel();
    _channel?.sink.close();
    super.dispose();
  }

  void _startDetection() {
    if (_controller == null || !_controller!.value.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please initialize the camera first.")),
      );
      return;
    }

    _channel = WebSocketChannel.connect(
        Uri.parse('wss://cec0-154-236-188-162.ngrok-free.app/ws'));

    _channel!.stream.listen((message) {
      setState(() {
        _emotion = "Detected Emotion: $message";
      });
    });

    _frameCaptureTimer =
        Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      if (_controller!.value.isInitialized) {
        final xFile = await _controller!.takePicture();
        final bytes = await xFile.readAsBytes();
        _channel!.sink.add(bytes);
      }
    });
  }

  void _stopDetection() {
    _frameCaptureTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
    setState(() {
      _emotion = "Detected Emotion: None";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emotion Detection'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _controller != null && _controller!.value.isInitialized
                  ? Container(
                      height: 300.0, // Set the desired height
                      width: 400.0, // Set the desired width
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: CameraPreview(_controller!),
                      ),
                    )
                  : Container(
                      height:
                          300.0, // Ensure consistent height with the preview
                      width: 400.0, // Ensure consistent width with the preview
                      color: Colors.grey,
                      child:
                          const Center(child: Text("Initializing camera...")),
                    ),
              const SizedBox(height: 20),
              Text(_emotion),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _startDetection,
                    child: const Text("Start Detection"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _stopDetection,
                    child: const Text("Stop Detection"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
