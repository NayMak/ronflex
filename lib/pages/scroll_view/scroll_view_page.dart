import 'package:flutter/material.dart';

class ScrollViewPage extends StatelessWidget {
  const ScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll View Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // A fixed-height child.
              color: Colors.blue, // Greenellow
              height: 240.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            Container(
              // Another fixed-height child.
              color: Colors.white, // Green Green
              height: 240.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            Container(
              // Another fixed-height child.
              color: Colors.red, // Green
              height: 240.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
          ],
        ),
      ),
    );
  }
}
