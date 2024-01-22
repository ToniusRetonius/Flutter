// ignore_for_file: prefer_const_constructors

/* 
En esta clase, sumamente vital para el desarrollo de una app vamos a ver FIREBASE. 

esta clase tiene varias partes: 
  - Conexión con la plataforma
  - Lectura desde la base de datos 
  - Guardar datos en la base de datos desde la app
  - Actualizar información existente en la db
  - Eliminar información existentes en la db

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

agregamos una dependencia de dev para que al enlazar el ID del proyecto, lo haga en todos los lugares necesarios

tenemos que tener instalado Firebase CLI, vamos a instalarlo...

una vez resuelto eso, en la terminal del proyecto
# Install the CLI if not already done so
dart pub global activate flutterfire_cli

como nosotros tenemos el proyecto creado desde la web, con un mail específico: tenemos que hacer el login desde la terminal con 
firebase login
una vez conectados, nos permite configurar : 
# Run the `configure` command, select a Firebase project and platforms
flutterfire configure

en la configuración podemos tanto crear un proyecto nuevo, como seleccionar aquél que tengamos ya inicializado desde la web

firebase_options tiene toda la data necesaria para la conexión
ya todo conectado a Firebase


hay que inicializar el proyecto de firebase: para eso las importaciones de firebase

tenemos que inicializar todos los widgets dentro de main

el tema es que firebase no es una base de datos, ofrece el servicio y ese es FIRESTORE DATABASE por ello, tenemos que instalar el paquete CLOUD FIRESTORE FLUTTER cloud_firestore: ^4.14.0

*/
/// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_basics/pages/edit_names.dart';
import 'package:flutter/material.dart';

/// importaciones firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// importaciones de rutas
import 'package:firebase_basics/pages/add_names.dart';
import 'package:firebase_basics/pages/home.dart';

void main() async {
  /// esto del main me asegura estar usando el paquete e inicializado el servidor a Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clase de Firebase',
      debugShowCheckedModeBanner: false,
      /* Creamos el sistema de rutas (ver clase 18) */
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/add': (context) => const AddName(),
        '/edit': (context) => const EditNames(),
        
      },

    );
  }
}

