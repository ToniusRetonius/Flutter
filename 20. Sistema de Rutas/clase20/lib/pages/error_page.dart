// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Error_page extends StatefulWidget {
  const Error_page({super.key});

  @override
  State<Error_page> createState() => _Error_pageState();
}

class _Error_pageState extends State<Error_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ha ocurrido un error Page"),
      ),
      body: const Text("ERROR 404"),
    );
  }
}