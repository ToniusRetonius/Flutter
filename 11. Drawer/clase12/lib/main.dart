// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// acá llamamos a DRAWER el menú lateral que vemos en la clase de hoy
        drawer: Drawer(
          child: Container(
            color: Color.fromARGB(255, 39, 0, 0),
            child: Column(children: [
              DrawerHeader(
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzS1ElbQT1hlZZk20SPbNrE3pNgVQu_i7um7XE5VR-OujiL8gBzoqrFj7j6N8tjQiSygY&usqp=CAU"),
              ),
              Text(
                "Hola humanos! Vengo a dominarlos!",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(255, 53, 23, 23),
                child: Text("Inicio", style: TextStyle(color: Colors.white ),),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(255, 53, 23, 23),
                child: Text("Configuración", style: TextStyle(color: Colors.white ),),
              ),
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Text("Salir", style: TextStyle(color: Color.fromARGB(255, 53, 23, 23),   ),),
              ),
            ]),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'Drawer',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 39, 0, 0),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
