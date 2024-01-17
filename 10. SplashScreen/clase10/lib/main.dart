// ignore_for_file: prefer_const_constructors

import 'package:clase10/screens/splash_screen.dart';
import 'package:flutter/material.dart';

/* 
En la clase de hoy veremos el SPLASH Screen
Un "splash screen" (pantalla de inicio o pantalla de presentación) es una pantalla que se muestra al inicio de una aplicación antes de que se cargue su contenido principal. La función principal de un splash screen es proporcionar una pantalla de bienvenida o presentación visual al usuario mientras la aplicación se inicializa en segundo plano. */
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}