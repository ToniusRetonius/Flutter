import 'package:clase14/widgets/formulario_pago.dart';
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clase 13',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pagá con Master, maestro', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 58, 23, 0),
        ),
        body: const FormCard() ,
      ),
    );
  }
}