/* 

En esta clase, sumamente vital para el desarrollo de una app vamos a ver FIREBASE. 
Ya trabajamos con Flutter, que nos permite darle forma a la Interfaz Grafica del Usuario (UI) pero si nos quedamos con eso no hacemos nada. El backend de nuestra app lo vamos a trabajar con FIREBASE, una plataforma de desarrollo móvil que facilita la creación de aplicaciones robustas y escalables sin tener que administrar la infraestructura del servidor. Ofrece muchos servicios como : 
  - almacenamiento en la nube
  - autenticación de usuarios
  - base de datos en tiempo real
  - hosting 
  - FCM cloud messaging ( permite enviar mensajer push a dispositivos mobile)
  - analytics 
entre otros...

para conectarnos vamos a correr en la terminal 
    flutter pub add firebase_core

si miramos el pubspec.yaml se agregó : firebase_core: ^2.24.2

tenemos que tener instalado Firebase CLI, vamos a instalarlo...

una vez resuelto eso, en la terminal 
# Install the CLI if not already done so
dart pub global activate flutterfire_cli

# Run the `configure` command, select a Firebase project and platforms
flutterfire configure
*/
import 'package:flutter/material.dart';

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
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}