import 'package:flutter/material.dart';

class DottedLineContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0, // Border width
        ),
      ),
      child: Center(
        child: Text(
          'Dotted Line Container',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Dotted Line Container Example'),
      ),
      body: Center(
        child: DottedLineContainer(),
      ),
    ),
  ));
}
