/* en esta página vamos a crearnos la screen de request para que el usuario ingrese información y que podamos capturarla y guardarla en la db de FireBase*/

import 'package:firebase_basics/servicios/services.dart';
import 'package:flutter/material.dart';

class EditNames extends StatefulWidget {
  const EditNames({super.key});

  @override
  State<EditNames> createState() => _EditNamesState();
}

class _EditNamesState extends State<EditNames> {
  /// esta es la creación de la variable que me permitirá capturar el nombre ingresado , el text se inicializa vacío
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    /// capturamos la información de la LISTTILE en una variable de tipo MAP
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    /// esto es porque el controller es de este tipo
    nameController.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Editar información",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 0, 43),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              /// para poder controlar a dónde va esa data necesitamos un controlador, para ello arriba nos creamos una variable de esa clase
              /// luego de tener la variable lista, le agregamos el controlador
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación',
              ),
            ),
            ElevatedButton(
              child: const Text("Editar"),
              onPressed: () async {
                /// en este lugar creamos la modificación
                /// para ello nos vamos a firebase_services y programamos la función que logra realizar el cambio
                /// la captura de la data funciona bien 
                await updatePeople(arguments['uid'], nameController.text).then((_) => {
                  Navigator.pop(context)});
              
                /// cuando hace el pop vuelve, pero no se actualiza la data, queda sólo guardada en la db, volvemos a Home -->
              },
            ),
          ],
        ),
      ),
    );
  }
}
