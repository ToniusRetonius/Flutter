// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:clase15/tabs/car.dart';
import 'package:clase15/tabs/plane.dart';
import 'package:clase15/tabs/walk.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      /// DEFAULT TAB CONTROLLER es el widget que vemos hoy
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff075E54),
          title: const Text('Tabs navigation', style: TextStyle(color: Colors.white),),
          /// bottom es la propiedad que recibe un TAB BAR y ese tab bar un array de tabs
          bottom: TabBar(tabs: [
           Tab(
            icon: Icon(Icons.directions_car),
           ), 
           Tab(
            icon: Icon(Icons.airplanemode_active_outlined),
           ), 
           Tab(
            icon: Icon(Icons.directions_walk),
           ), 
          ],
          
          /// color del ícono no seleccionado
          unselectedLabelColor: Colors.white.withOpacity(0.5),
          
          /// color del ícono seleccionado
          labelColor: Colors.white,
          
          /// aparece una barra que indica en qué TAB estoy, eso se puede personalizar
          indicator: BoxDecoration(
            border: Border(bottom: BorderSide(
              color: Colors.white,
              width: 4,))
          ),
          /// si queremos personalizar cuando paso el cursor sobre la app
          indicatorColor: Colors.transparent,
          indicatorWeight: 4,
          ),
          
        ),
        body: const TabBarView(
          /// el TAB BAR VIEW es lo que va a corresponderse con la vista al moverse por los diferentes TABS
          /// que para modularizar el código lo hacemos en la carpeta 'tabs'
          children: [
            Car(),
            Plane(),
            Walk(),
          ],

          
        )
        ),
      );
  }
}