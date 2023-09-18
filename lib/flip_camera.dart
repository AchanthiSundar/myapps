import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
  );

  runApp(
    MaterialApp(
      home: CameraScreen(camera: frontCamera),
    ),
  );
}

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  CameraScreen({required this.camera});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  bool isFrontCamera = true;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }

    // Apply horizontal flip to remove the mirrored effect
    final cameraFeed = Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(isFrontCamera ? 0 : 3.14159265),
      child: CameraPreview(_controller),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera with No Mirrored Effect'),
        actions: [
          IconButton(
            icon: Icon(Icons.flip_camera_ios),
            onPressed: () {
              setState(() {
                isFrontCamera = !isFrontCamera;
                _controller = CameraController(
                  isFrontCamera ? widget.camera : widget.camera,
                  ResolutionPreset.medium,
                  imageFormatGroup: ImageFormatGroup.jpeg,
                );

                _controller.initialize().then((_) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {});
                });
              });
            },
          ),
        ],
      ),
      body: Center(
        child: cameraFeed,
      ),
    );
  }
}
