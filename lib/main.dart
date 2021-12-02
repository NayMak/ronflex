import 'package:flutter/material.dart';
import 'package:ronflex_flutter/pages/null_safety/null_safety_page.dart';
import 'package:ronflex_flutter/pages/provider_consumer/provider_consumer_page.dart';
import 'package:ronflex_flutter/pages/provider_multiprovider/provider_multiprovider_page.dart';
import 'package:ronflex_flutter/pages/provider_selector/provider_selector_page.dart';
import 'package:ronflex_flutter/pages/scan_camera/scan_camera_page.dart';
import 'package:ronflex_flutter/pages/scroll_view/scroll_view_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ronflex App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/scroll_view',
      routes: {
        '/provider_selector': (context) => ProviderSelectorPage(),
        '/provider_consumer': (context) => ProviderConsumerPage(),
        '/provider_multiprovider': (context) => ProviderMultiProviderPage(),
        '/null_safety': (context) => NullSafetyPage(),
        '/scan_camera': (context) => ScanCameraPage(),
        '/scroll_view': (context) => ScrollViewPage(),
      },
    );
  }
}
