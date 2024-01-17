import 'package:clase17/paginas/home.dart';
import 'package:flutter/material.dart';

/* En esta clase vemos el Widget SlingUpPanel que lo podemos utilizar descargando la dependencia sliding_up_panel:  
https://pub.dev/documentation/sliding_up_panel/latest/
*/
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Clase 17',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}