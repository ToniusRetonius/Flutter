
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          /*
          esta forma es vieja y molesta : : 
          MaterialPageRoute route =
              MaterialPageRoute(builder: (context) => SegundaPage());
          Navigator.push(context, route) 
          por eso lo hacemos en Main.dart creando el sistema y acá simplemente:
          */
          /* Navigator.pushNamed(context, routeName) donde route name es lo que tenemos entre ' ' en main */
          /* acá uso una ruta que no existe para probar que funciona la captura del error */
          Navigator.pushNamed(context, '/quinta');
        },
        child: const Text("Ir a la segunda página"),
      )),
    );
  }
}
