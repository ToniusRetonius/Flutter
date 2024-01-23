import 'package:clase21/services/notifications.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            /// acá va lo notificación, tenemos que crearnos ese método en notifications.dart
            mostrarNotificacion();
          },
          child: const Text("Mostrar la notificación")),
    );
  }
}
