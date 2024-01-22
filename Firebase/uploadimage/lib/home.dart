// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uploadimage/servicios/select.dart';
import 'package:uploadimage/servicios/upload.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// como no hay drama que nuestra imagen sea null, por defecto lo es
  File? imagen_a_subir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 167, 255, 218),
          title: const Text(
            'Subir imágenes a Firebase',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            /// si la imagen no es null, (?) la mostramos (tenemos que volver a insistirle a Flutter con el !)
            /// caso contrario (:) mostramos el container de color
            /// si queremos probarlo desde EDGE falla pues Image.file() es para correrlo en un celu
            imagen_a_subir != null
                ? Image.file(imagen_a_subir!)
                : Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: const Color.fromARGB(255, 243, 226, 175),
                    ),
                    child: Icon(Icons.image),
                  ),
            ElevatedButton(
                onPressed: () async {
                  final XFile? imagen = await getImage();
                  setState(() {
                    imagen_a_subir = File(imagen!.path);
                  });
                },
                child: const Text("Seleccionar imagen")),
            ElevatedButton(
                onPressed: () async {
                  if (imagen_a_subir == null) {
                    return null;
                  }

                  /// como ya campuramos el estado del upload, queremos guardarnos ese valor de verdad en esta variable

                  final uploaded = await uploadImage(imagen_a_subir!);

                  /// ScaffoldMessenger.of(context).showSnackBar: Utiliza el ScaffoldMessenger para mostrar un SnackBar. El SnackBar toma un widget content que contiene el mensaje que deseas mostrar.
                  if (uploaded) {
                    ScaffoldMessenger.of(context).showSnackBar(const

                        /// al snackbar le podemos dar estilo también
                        SnackBar(
                      content: Text(
                        "La imagen se subió correctamente!",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Color.fromARGB(255, 167, 255, 218),
                    ));

                    /// acá vamos a querer que una vez subida correctamente, vuelva a su estado null la imagen ( = que desaparezca del container para permitir subir otra)
                    setState(() {
                      imagen_a_subir = null;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("Se produjo un error, intente nuevamente!")));
                  }
                },
                child: const Text("Subir imagen")),
          ],
        ));
  }
}
