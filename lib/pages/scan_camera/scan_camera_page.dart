import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanCameraPage extends StatelessWidget {
  const ScanCameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Camera Page'),
      ),
      body: Container(
        child: Center(
          child: Text('salut les copains'),
        ),
      ),
    );
  }
}
