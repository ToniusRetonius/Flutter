// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}