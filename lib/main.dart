import 'package:flutter/material.dart';
import 'package:flutterapp/screens/guest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 227, 67, 101)),
        useMaterial3: true,
      ),
      home: const Guest(),
    );
  }
}
