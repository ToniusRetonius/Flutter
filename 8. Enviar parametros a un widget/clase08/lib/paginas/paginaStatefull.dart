// ignore_for_file: file_names, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class stateFull extends StatefulWidget {
  final String text;
  const stateFull(
    this.text,
    {super.key}
    );

  @override
  State<stateFull> createState() => _stateFullState();
}

class _stateFullState extends State<stateFull> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statefull',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Statefull'),
        ),
        body: Center(
          /// para el caso de las statefull la forma de recibir la data es diferente
          child: Text(widget.text),
        ),
      ),
    );
  }
}
