// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Entrar"),
          onPressed: () {
            /* con el primero guardamos la posición de la ruta, es decir que al moverse queda la flechita para volver */
            /* Navigator.pushNamed(context, '/home'); */
            /* en este caso, se reemplaza la posición, destruye el login y deja la que llamamos*/
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
    );
  }
}
