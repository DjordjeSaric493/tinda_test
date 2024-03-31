import 'package:flutter/material.dart';
import 'package:tinda_test/widgets/navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavBar(),
    );
  }
}
