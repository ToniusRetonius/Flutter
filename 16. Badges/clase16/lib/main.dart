// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

/* En esta clase vemos BADGES
Básicamente son los globitos que nos dice si tenemos notificaciones, y cuántas en algunos casos */
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLabelVisible = true;

  bool isEmojiVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clase 16',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Badges'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLabelVisible = !isLabelVisible;
                    });
                  },
                  child: Text("Mostrar / Ocultar")),
            ),

            /// el widget INKWELL me permite trabajar con un elemento al que quisiese mantener apretado... u otras cosas
            InkWell(
              onLongPress: () {
                setState(() {
                  isEmojiVisible = !isEmojiVisible;
                });
              },
              child: Badge(
                largeSize: 30,
                isLabelVisible: isEmojiVisible,
                backgroundColor: const Color.fromARGB(255, 255, 236, 178),
                /// para poner el emoji en Windows tocamos BOTÓN WINDOWS + PUNTO
                label: const Text("😁"),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  color: Colors.amber,
                  child: Text(
                    "Esto es un mensaje que enviaron por chat",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              label: "",
              icon: Badge(
                isLabelVisible: isLabelVisible,
                child: Icon(Icons.home),
                label: Text("1"),
              )),
          BottomNavigationBarItem(
              label: "",
              icon: Badge(
                /// el atributo is label visible me permite por ejemplo pensar que si no hay mensajes, que sea false, y que si hay, que muestre qué cantidad
                isLabelVisible: isLabelVisible,
                backgroundColor: Color.fromARGB(255, 161, 255, 138),
                child: Icon(Icons.search),
                label: Text("3"),
              )),
          BottomNavigationBarItem(
              label: "",
              icon: Badge(
                isLabelVisible: isLabelVisible,
                backgroundColor: const Color.fromARGB(255, 255, 218, 108),
                child: Icon(Icons.person),
                label: Text("5"),
              )),
        ]),
      ),
    );
  }
}
