import 'package:clase19/pages/home.dart';
import 'package:flutter/material.dart';

/* 
En Flutter, provider es una biblioteca que facilita la administración del estado en tu aplicación. Proporciona una forma sencilla y eficiente de pasar y administrar el estado entre widgets.

La biblioteca provider se basa en el concepto de "provider" que ofrece un valor y permite a los widgets hijos consumir ese valor. Cuando el valor cambia, los widgets que dependen de ese provider se reconstruyen automáticamente.

Hay varios tipos de providers en la biblioteca provider, pero uno de los más comunes es ChangeNotifierProvider, que se utiliza junto con clases que implementan la interfaz ChangeNotifier. Esta interfaz facilita la notificación de cambios en el estado a los widgets que dependen de ese estado.
*/

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: HomePage(),
      ),
    );
  }


}