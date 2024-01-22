import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

/*  vamos a usar este servicio para capturar la funcionalidad de este servicio en storage 
ese objeto luego será manipulado para sacarle todo el jugo */
final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage(File image) async {
  /// en esta función vamos a realizar toda la lógica para subir esta imagen
  /// capturamos el nombre de la imagen para luego tener como un id

  /*
    print(image.path);
   una vez que nos imprimimos en consola el path de la imagen : 
   I/flutter (10436): /data/user/0/com.example.uploadimage/cache/5cb0a369-0ff9-40cd-a1df-f68191decae7/1000000033.jpg
   nos guardamos la última parte
   1000000033.jpg
   para hacer eso usamos el método .split() queremos que se divida por la barra invertida y el método .last nos permite capturar la última aprte
   */

  final String namefile = image.path.split("/").last;

  /// una vez capturada, la subimos
  /// le asignamos al primer child la ruta en donde queremos encontrarla en el proyecto y en la segunda parte, el namefile la idea es dividir en carpetas los archivos para matener cierto orden

  Reference ref = storage.ref().child("imagenes").child(namefile);

  /// nos guardamos en ref toda esa referencia para luego
  /// hacer la tarea de subirla
  final UploadTask uploadTask = ref.putFile(image);

  /* print(uploadTask); */

  /// tenemos que crearnos alguna variable que monitoree la tarea
  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);

  /// pues cómo sabemos si realmente se guardó?
  /// vamos a capturar la url de la imagen que ya se guardó
  final String url = await snapshot.ref.getDownloadURL();
  /* print(url); */


  /// queremos saber si el el upload fue exitoso
  if (snapshot.state == TaskState.success) {
    return true;
  } else {
    return false;
  }
}
