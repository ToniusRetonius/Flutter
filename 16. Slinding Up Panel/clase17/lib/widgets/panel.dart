import 'package:flutter/material.dart';

class PanelUp extends StatelessWidget {
  const PanelUp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Ruta del archivo: ${"imagenes/map.jpg"}");
    return Container(
      decoration: BoxDecoration(
        /// algo para mencionar es que si yo le cambio la forma (borderRadius) tengo que modificar el panel también porque sino queda una formita rara al fondo
        /// esa modificación es la de color == transparent
        color: Color.fromARGB(255, 0, 65, 77),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        
       children: [
        Icon(Icons.drag_handle_rounded),

        Image.asset("imagenes/images.jpg"),
       ],
      ),
    );
  }
}