// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clase de Alert Dialog",
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
  /// acá voy a definir una variable booleana
  /// inicializada en false por defecto pues no se han aceptado los t y c
  /// el tema de esta variable será el scope, pues será local en la clase y si definimos una función por fuera de ella, no aparecerá
  /// para resolver lo anterios, podemos meter la función dentro de la clase o hacerla global
  bool falso = false;

  @override
  Widget build(BuildContext context) {
    /// fijarse que acá tenemos un context y ese mismo es el que tenemos que llevarnos a la alerta luego
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
        backgroundColor: const Color.fromARGB(255, 108, 214, 191),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 108, 214, 191)),
                onPressed: () {
                  alerta(context);
                },
                child: Text(
                  "Mostrar alerta",
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),

            /// vamos a querer mostrar algún texto o algo que luego de lanzar la alerta y captar la respuesta del cliente, cambie
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(255, 104, 205, 255),
              ),
              child: Text(
                /// llamamos a nustra variable definida al principio "acepto"
                /// la forma de escribir esto es con una "condicional ternaria"
                /// "nombre de la variable" ? "si es true aparece este texto" : "si es flase aparece este texto"
                falso
                  ? " Ya aceptó los términos y condiciones "
                  : " Usted todavía no aceptó los términos y condiciones ",
                style: TextStyle(color: Colors.black,),
                
              ),
            )
          ],
        ),
      ),
    );
  }

  /// meto la función acá porque setState es una función de la clase statefulW

  void alerta(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            /// vamos a implementar un condicional ternario para ver si el cliente quiere aceptar o no los términos y si se arrepiente puede cambiar de opinión
            falso 
              ? "Estás arrepentida perrita?"
              : "Está de acuerdo con los términos?",
            ),
          content: Text(
              falso 
              ? "Si te arrepentís de aceptar los términos y condiciones, te afanamos la identidad careta"
              : "No te vamos a robar tu información personal ",
              ),
          actions: [
            ElevatedButton(

                /// si queremos darle un poco de estilo al botón podemos usar
                style: ElevatedButton.styleFrom(
                  /// acá mandamos todo
                  backgroundColor: const Color.fromARGB(255, 7, 46, 51),

                  /// con elevation: int , le cambiamos la elevación del botón
                  /// con shape:  le damos detalles a la forma del botón
                ),
                onPressed: () {
                  print("El cliente dijo que SÍ está de acuerdo");

                  /// vamos a sumar una función llamada setState () {}
                  /// esta función realiza cambios en la pantalla
                  setState(() {
                    falso = !falso;
                  });

                  Navigator.pop(context);
                },
                child: Text(
                  "Sí",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 7, 46, 51)),
                onPressed: () {
                  print("El cliente dijo que NO está de acuerdo");
                  Navigator.pop(context);
                },
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }
}


/// esta es una alerta ejemplo  ::: 

void mostrar_alerta(BuildContext context) {
  /// como me pide el contexto, tengo que traerme el contexto de arriba
  /// eso se logra pasando como parámetro de la función el objeto
  /// BuildContext
  showDialog(
    /// barrier dismissible lo que hace es permitir o no que si toco por fuera de la alerta se desaparezca ( esto nos lleva a determinar un botón que devuelva información)
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        /// título y contenido de la alerta
        title: Text("Título de la alerta"),
        content: Text("Este es el contenido de la alerta"),

        /// en actions puedo programar botones o widgets para capturar data
        actions: [
          TextButton(
              onPressed: () {
                /// acá podemos hacer cualquier acción y luego requiere que usemos la vuelta porque flutter considera que nos fuimos de pestaña
                /// .... ACCIÓN   ... ///
                Navigator.of(context).pop();
              },
              child: Text(
                  "Acá puede ir la acción que realizamos cuando hacemos el click"))
        ],
      );
    },
  );
}
