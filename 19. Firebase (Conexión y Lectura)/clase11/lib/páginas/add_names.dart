/* en esta página vamos a crearnos la screen de request para que el usuario ingrese información y que podamos capturarla y guardarla en la db de FireBase*/

import 'package:clase11/servicios%20Firebase/services.dart';
import 'package:flutter/material.dart';

class AddName extends StatefulWidget {
  const AddName({super.key});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  /// esta es la creación de la variable que me permitirá capturar el nombre ingresado , el text se inicializa vacío
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pedido de información",
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
                hintText: 'Ingrese su nombre',
              ),
            ),
            ElevatedButton(
              child: const Text("Guardar"),
              onPressed: () async {
                /// acá realizamos la acción de subir el dato, como se trata de un Future la función addPeople.. queremos que esta parte sea Async
                /// tenemos un tema, cuando le damos a guardar después no pasa nada ... queremos que se cierre la página ... por eso usamos .then que nos permite, luego de la guarda hacer algo, en este caso, volver al Inicio
                addPeople(nameController.text).then((_) => {
                  Navigator.pop(context)
                });

                /// cuando hace el pop vuelve, pero no se actualiza la data, queda sólo guardada en la db, volvemos a Home -->

              },
            ),
          ],
        ),
      ),
    );
  }
}
