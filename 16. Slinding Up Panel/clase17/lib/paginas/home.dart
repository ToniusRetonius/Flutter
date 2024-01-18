import 'package:clase17/widgets/home_body.dart';
import 'package:clase17/widgets/panel.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 0, 65, 77),
          title: const Text('Slinding Up Panel', style: TextStyle(color: Colors.white),),
        ),
        body: SlidingUpPanel(
          color: Colors.transparent,
          /// el minHeight lo que nos permite es darle la altura mínima al panel
          /// así también exite el MAX HEIGHT
          minHeight: 30,
          /// es recomendable darle al máximo dependiendo el dispositivo
          /// para ello usamos MediaQuery y le damos el 70% de la pantalla por ej
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          panel: const PanelUp(),
          body: HomeBody(),

        )
      );
  }
}