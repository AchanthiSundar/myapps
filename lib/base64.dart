import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerDemo extends StatefulWidget {
  @override
  _FilePickerDemoState createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  String base64String = '';
  String fileName = "";
  String fileSize = "";
  String fileExtension = "";
  String filePathBase64 = "";

  // Future<void> openFilePicker() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //     List<int> bytes = await file.readAsBytes();
  //     String encoded = base64Encode(bytes);
  //
  //     setState(() {
  //       base64String = encoded;
  //     });
  //   }
  // }
  Future<void> openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: [ 'jpg','png','pdf']);
    PlatformFile? _platformFile = result!.files.first;
    final kb = _platformFile!.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    if (result != null) {
      File file = File(result.files.single.path!);
      List<int> bytes = await file.readAsBytes();
      String encoded = base64Encode(bytes);


      setState(() {
        fileName = _platformFile!.name;
        fileSize = size;
        fileExtension = _platformFile.extension!;
        filePathBase64 = encoded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Picker to Base64'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: openFilePicker,
                child: Text('Pick a File'),
              ),
              SizedBox(height: 20),
              Text('Base64 String:'),
              Text(filePathBase64),
              Text(fileSize),
              Text(fileName),
              Text(fileExtension),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: FilePickerDemo()));
}
