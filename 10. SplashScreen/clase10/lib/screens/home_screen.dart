import 'package:flutter/material.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}