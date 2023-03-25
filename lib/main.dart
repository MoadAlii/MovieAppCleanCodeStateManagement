import 'package:clean/test/test_screen.dart';
import 'package:flutter/material.dart';

import 'core/services/service_locator.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const TestScreen(),
    );
  }
}
