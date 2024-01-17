// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

/// en el paquete math de dart hay cosas de mate (como random)
import 'dart:math';

import 'package:flutter/material.dart';

/// en esta clase queremos animar un contenedor
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animated Container",
      debugShowCheckedModeBanner: false,
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
  /// acá definimos las variables que luego iré modificando para animar el container
  double ancho = 100.0;
  double alto = 100.0;
  Color color = Color.fromARGB(255, 9, 101, 172);
  BorderRadius borde = BorderRadius.circular(10);

  void cambiar_forma() {
    /// para hacer algo más lindo, podemos llamara a Random y pedirle números random y cambiar la forma aleatoriamente

    final random = Random();    
    
    setState(() {

      ancho = random.nextInt(350).toDouble();
      alto = random.nextInt(350).toDouble();

    /// pero qué pasa con el color?
    /// para RGB son máximo 255 (blanco) y 0 (negro)
    /// la opacity va de 0 (transparente) a 1 (opaco)
      color = Color.fromRGBO(random.nextInt(255),random.nextInt(255) , random.nextInt(255), 1);

      borde = BorderRadius.circular(random.nextInt(20).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animated Container",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 31, 0, 88),
      ),
      body: Column(
        children: [
          /// Expanded toma todo el resto del espacio disponible
          Expanded(
            child: Center(
              /// si dejamos este child como Container, los cambios de forma serán muy bruscos, por tanto se introduce el AnimatedContainer
                child: AnimatedContainer(

                  /// un requiere es la duration 
                  duration: Duration(milliseconds: 400),

                  /// existe una prop llamada curve para definir CÓMO será esa animación
                  curve: Curves.elasticInOut,

                  width: ancho,
                  height: alto,

                  /// queremos darle bordes redondeado al container
                  /// para ello usamos decoration : boxDecoration
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: borde,
                  ),

                  /// la idea de esta clase es conseguirse un botón que haga que cambie la forma del container
                  /// para ello, definimos variables arriba
                )
            ),
          ),
          ElevatedButton(

              /// el llamado a función es sólo con su nombre
              onPressed: cambiar_forma,
              child: Text("Cambiar forma!"))
        ],
      ),
    );
  }
}
