// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class MainGamePage extends StatelessWidget {
  const MainGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
