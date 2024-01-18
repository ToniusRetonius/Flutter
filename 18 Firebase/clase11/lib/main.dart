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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// importaciones firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:clase11/servicios%20Firebase/services.dart';

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
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lectura de Firebase'),
        ),

        /// por qué metemos un future builder ? porque cuando trabajamos con la base de datos que leemos, es de tipo Future
        body: FutureBuilder(
          /// ejecuta el future y el res va al builder
          future: getPeople(),

          /// en esta sección se agrega un contexto y el snapshot que es el res de Future
          builder: (context, snapshot) {
            /// si queremos devolver la lista que leemos de la db usamos ListView.builder y tenemos varios atributos
            /// como devolver esto toma tiempo por las peticiones y todo el embrollo, tenemos que hacer un hasData
            if (snapshot.hasData){ 
              return ListView.builder(

                /// se explica al final la dif entre ? y ! para manejar el null
                itemCount: snapshot.data?.length,

                itemBuilder: (context, index) {
                    return Text(snapshot.data?[index]['name']);
                 }
            );
            } else {
              /// tenemos que controlar los milisegundos que tarda en llegar y por tanto metemos un CircularProgressIndicator
              return const Center( 
                child: CircularProgressIndicator()
                );
            }
          },
        )
      );
  }
}

/*   
  ?: Se usa para permitir que una expresión sea nula y manejarla de manera segura sin lanzar excepciones.
    
  !: Se usa para afirmar que una expresión no es nula, incluso si el sistema de tipos indica lo contrario. Puede resultar en una excepción si la expresión es nula. 
*/