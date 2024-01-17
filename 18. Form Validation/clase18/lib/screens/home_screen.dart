import 'package:clase18/widgets/form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Form Validation", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 12, 0, 54),
      ),

      body: const Formulario(),
    );
  }
}