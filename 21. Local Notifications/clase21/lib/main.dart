import 'package:clase21/pages/home.dart';
import 'package:clase21/services/notifications.dart';
import 'package:flutter/material.dart';
/* esto no funciona ... tira este error:

Unable to find the library for file:///c%3A/Users/astro/Desktop/Aprendiendo%20Flutter/21.%20Local%20Notifications/clase21/lib/main.dart
#0      DartDebugAdapter.evaluateRequest (package:dds/src/dap/adapters/dart.dart:1060:7)
<asynchronous suspension>
#1      BaseDebugAdapter.handle (package:dds/src/dap/base_debug_adapter.dart:141:7)
<asynchronous suspension>
 
*/
/* 
la idea de la clase de hoy es trabajar con Local Notifications 
tenemos que agregar un paquete llamado flutter_local_notifications 
https://pub.dev/packages/flutter_local_notifications

para agregarlo : 
  flutter pub add flutter_local_notifications

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

nosotros tenemos que llamar al paquete desde el inicio
*/
void main() async {
  /* esta línea se asegura de que se ejecuten todas las inicializaciones antes quel runApp */
  WidgetsFlutterBinding.ensureInitialized();
  /* después esperamos a nuestro servicio y luego llama al runApp */
  await initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notificaciones',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Local Notifications',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 27, 49),
          
        ),
        body: const HomePage(),
      ),
    );
  }
}
