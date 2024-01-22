// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

/// en esta clase vamos a trabajar con la persistencia de los datos
/// eso quiere decir que si yo actualizo la app, el estado de las variables no se reestablece sino que mantiene su último estado anterior
/// para verlo, vamos a implementar un contador que guarde el estado
/// vamos a necesitar agregar la dependencia : shared_preferences e importarla
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Persistencia de datos",
      home: Inicio(),
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

  int value = 0;

  aumentarValor() async {
    /// para que await no tire error hay que definir nuestra función como async

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    /// depende qué tipo de dato quiera guardar uso el método adecuado
    /// en este ejercicio guardamos un int por ello :
    /// prefs.setInt("value", value);
    /// si quisiese otro valor ? sea booleano...
    /// prefs.setBool(str key, bool value)

    setState(() {
      value = value + 1;

      /// en la clave "value" guardate la var value
      prefs.setInt("value", value);
    });
  }

  @override
  void initState() {
    super.initState();
    cargarPreferencia();
  }

  /// el problema es que init state no puede ser async
  /// por ello me creo otra función que pueda serlo

  cargarPreferencia() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      /// si es null entonces devolvé 0
      value = prefs.getInt("value") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Peristencia de datos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 56, 0, 23),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value.toString(),
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: aumentarValor,
              child: Text("Aumentar valor"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 56, 0, 23),

                /// para darle color a la letra :
                foregroundColor: Colors.white,

                /// espaciado interno del botón
                padding: EdgeInsets.all(10),

                /// bordes
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// qué pasa si queremos reestablecer los datos de las variables 
/// tenemos que seleccionar botón derecho, app info --> force stop 
/// después storage & cache --> clear storage 

/// apuntes de pub.dep del paquete shared_preferences

/// // Obtain shared preferences.
///final SharedPreferences prefs = await SharedPreferences.getInstance();

/// Save an integer value to 'counter' key.
///   await prefs.setInt('counter', 10);

/// Save an boolean value to 'repeat' key.
///   await prefs.setBool('repeat', true);

/// Save an double value to 'decimal' key.
///   await prefs.setDouble('decimal', 1.5);

/// Save an String value to 'action' key.
///   await prefs.setString('action', 'Start');

/// Save an list of strings to 'items' key.
///   await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);

/// Try reading data from the 'counter' key. If it doesn't exist, returns null.
///   final int? counter = prefs.getInt('counter');

/// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
///   final bool? repeat = prefs.getBool('repeat');

/// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
///   final double? decimal = prefs.getDouble('decimal');

/// Try reading data from the 'action' key. If it doesn't exist, returns null.
///   final String? action = prefs.getString('action');

/// Try reading data from the 'items' key. If it doesn't exist, returns null.
///   final List<String>? items = prefs.getStringList('items');

/// Remove data for the 'counter' key.
///   await prefs.remove('counter');