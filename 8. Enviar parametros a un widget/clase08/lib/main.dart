// ignore_for_file: prefer_const_constructors

import 'package:clase08/paginas/paginaStatefull.dart';
import 'package:clase08/paginas/paginaStateless.dart';
import 'package:flutter/material.dart';

/// para comentar shortcut ALT + SHIFT + A
/// en esta clase vemos cómo se puede capturar información de tipo string en un text field y ser enviada a otra página

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Enviar parámetros",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    /// me voy a crear la variable que me va a permitir escribir en stateless la info introducida en Main

    TextEditingController texto = TextEditingController(text: "");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enviar parámentros",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 30, 0, 36),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),

              /// acá aprendemos sobre el método TextField
              /// funciona para que el usuario ingrese información
              child: TextField(
                /// podemos darle estilo con decoration ...
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color.fromARGB(255, 238, 255, 207),
                    filled: true,
                    hintText: "Ingresá información"),

                /// la propiedad controller me permite capturar la información ingresada y guardarla en una variable. 
                /// la clase TextEditingController tiene el atributo .text que accede a ese texto escrito en el TextField
                controller: texto,
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => paginaStateless(texto.text)));
              },
              child: Text("Enviar a Stateless")),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> stateFull(texto.text)));

            }, 
            child:  Text("Enviar a StateFull")),
        ],
      ),
    );
  }
}
