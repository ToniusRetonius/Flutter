import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uploadimage/firebase_options.dart';
import 'package:uploadimage/home.dart';

/*
 la idea de esta clase es aprender a subir archivos a Firebase usaremos la librería 
"IMAGE_PICKER" https://pub.dev/packages/image_picker 
a través de la terminal flutter pub add image_picker

recordamos cómo conectarse a firebase : 
  - flutter pub add firebase_core
  - dart pub global activate flutterfire_cli
  - flutterfire configure

para este proyecto en lugar de utilizar Firebase Database vamos a usar STORAGE
para configurarlo tenemos que hacerlo desde la página web

luego agregamos la librería de FIREBASE_STORAGE https://pub.dev/packages/firebase_storage
  - flutter pub add firebase_storage
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* se utiliza en Flutter para asegurarse de que los "widgets" estén inicializados antes de ejecutar el código principal de la aplicación. Esto es especialmente importante cuando estás trabajando con operaciones asíncronas o inicializaciones que deben ocurrir antes de que la interfaz de usuario se construya. */

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  /* 
  Firebase.initializeApp: Este método inicializa Firebase en tu aplicación. Debes llamar a este método antes de utilizar cualquier otro servicio de Firebase.
  
  options: DefaultFirebaseOptions.currentPlatform: Aquí se especifican las opciones de configuración para la inicialización de Firebase. 
  
  DefaultFirebaseOptions.currentPlatform proporciona las opciones predeterminadas específicas de la plataforma en la que se está ejecutando la aplicación (por ejemplo, iOS o Android). Puedes personalizar las opciones según tus necesidades, pero en muchos casos, las opciones predeterminadas son suficientes. */

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Subir archivos',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
