// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:clase04/paginas/home.dart';
import 'package:clase04/paginas/mail.dart';
import 'package:flutter/material.dart';

/// esta clase se trata de la navigation bar que es justamente la barra que se encuentra abajo a través de la cual podremos navegar por las distintas pantallas de la app
///

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom Navigation Bar",
      home: Inicio(),

      /// cómo sacamos el flag ese que dice "debug" ?
      debugShowCheckedModeBanner: false,
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int pagina_actual = 0;

  /// la forma elegante de hacerlo que decíamos abajo es: hacerse una lista de widgets

  List<Widget> paginas = [
    Home(),
    Mail(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bottom Navigation Bar",
          style: TextStyle(
              fontSize: 25.0, color: Colors.white, fontFamily: 'Roboto'),
        ),
        backgroundColor: const Color.fromARGB(255, 11, 31, 48),
      ),

      /// llegamos a lo que nos interesaba : la bottom navigation bar
      /// es una  propiedad del scaffold
      bottomNavigationBar: BottomNavigationBar(
        /// items es un array de widget de tipo BottomNavigationBarItem
        items: [
          /// si sólo escribo los BottomNav... () me da error pues es requerimiento que tenga un título o label por cada item y no puede ser null
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Mail"),
        ],

        /// hay una propiedad del BottomNavigationBar que se llama "currentIndex"
        /// por defecto es 0
        /// este campo representa cuál de los items está seleccionado (cambia su color)
        currentIndex: pagina_actual,

        /// también tiene la propiedad OnTap() que recibe una función tal que recibe un int
        onTap: (indice) {
          setState(() {
            pagina_actual = indice;
          });
        },
      ),

      /// queremos navegar, por tanto tenemos varias formas
      /// si tenemos dos items, basta con un operador ternario
      
      /// body: pagina_actual == 0 ? Home() : Mail(),

      /// otra manera de hacerlo es, y más elegante ... ver arriba
      /// llamamos a la lista y le damos la actual
      
      body: paginas[pagina_actual],
    );
  }
}
