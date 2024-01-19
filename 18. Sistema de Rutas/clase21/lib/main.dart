// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
/// importamos sólo un archivo con todas las rutas
import 'pages/index.dart';

void main() => runApp(MyApp());

/* En esta clase vamos a ver el sistema de rutas 
En Flutter, un sistema de rutas se refiere a la gestión de las distintas pantallas o vistas de una aplicación. Flutter utiliza un enfoque basado en el sistema de navegación por rutas para controlar cómo se muestran y se cambian las diferentes páginas o pantallas en una aplicación.

Un sistema de rutas en Flutter generalmente se implementa utilizando el widget Navigator, que maneja la pila de rutas (o stack de rutas) y permite la transición entre ellas. Cada pantalla o vista en Flutter se puede representar como un widget, y se pueden apilar y desapilar en el Navigator según la lógica de navegación de la aplicación.

Flutter proporciona una clase llamada MaterialApp que generalmente sirve como el widget raíz de una aplicación Flutter. MaterialApp incluye un Navigator integrado y facilita la implementación de un sistema de rutas utilizando el concepto de Routes (rutas) y PageRouteBuilder (constructor de rutas de página).
*/

class MyApp extends StatelessWidget {MyApp({super.key});

  /* acá hacemos la variable con las rutas */
  final _routes = {
        /// si yo tengo un Login ... no queremos que tenga la flechita para volver, porque ya estás dentro ...  qué hacemos ?
        /// mirar login.dart cómo usamos el Navigation
        '/': (context) => const Login_page(),
        '/home': (context) => const HomePage(),
        '/segunda': (context) => const SegundaPage(),
        '/tercera': (context) => const Tercera(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clase de Rutas',
      debugShowCheckedModeBanner: false,
      /* 
      vamos a definir la ruta inicial y luego las distintas rutas 
      para ello, usamos initialRoute y luego routes
      */
      /* qué pasa si tenemos tantas páginas para recorrer en el sistema de rutas? 
      tenemos que modularizar las immportaciones en main y para ello usamos index
      y tenemos que hacernos una variable */
      initialRoute: '/',
      routes: _routes,

      /// si queremos capturar un posible error en el sistema de rutas ( ejemplo el botón va a una ruta que no existe ... usamos )
      onGenerateRoute: ((settings) {
        return MaterialPageRoute(builder: (context) => const Error_page());
      }),


    );
  }
}
