// ignore_for_file: prefer_const_constructors

import 'package:clase02/paginas/pagina02.dart';
import 'package:flutter/material.dart';

/// para navegar vamos a por ejemplo usar un botón que nos lleve a otra pantalla
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// MaterialApp es un patron de diseño con sus atributos
      title: "MyApp",
      /// inicio será un elemento de tipo stateful
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Navegando por la app"),
        backgroundColor: Color.fromARGB(255, 145, 255, 182),),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Text("Home", textAlign: TextAlign.center,),

          /// acá vamos a meter nuesto botón de navegación (puede ser de cualquier tipo)
          TextButton(
            onPressed: ()=>{
              /// y aquí sucede la magia
              /// Navigator.push(context, route)
              Navigator.push(
                context, 
                /// Material Page Route 
                MaterialPageRoute(builder: (context) => Pagina02())
                )
            }, 
            child: Text("Ver términos y condiciones"))
        ],
      ),
    );
  }
}