// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class paginaStateless extends StatelessWidget {
  /// en esta parte necesitamos una variable para recibir ese input
  final String text;

  const paginaStateless(
    /// lo agrego en el constructor
    this.text,
    {super.key}
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stateless",
          style: TextStyle(color: Color.fromARGB(255, 255, 234, 172)),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
