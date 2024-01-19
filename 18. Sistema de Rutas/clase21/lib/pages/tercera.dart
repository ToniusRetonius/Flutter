import 'package:flutter/material.dart';

class Tercera extends StatefulWidget {
  const Tercera({super.key});

  @override
  State<Tercera> createState() => _TerceraState();
}

class _TerceraState extends State<Tercera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tercera Page"),
      ),
      body: const Text("hola"),
    );
  }
}