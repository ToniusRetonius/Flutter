// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace

/// packages:
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swiper de imágenes",
      home: Inicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Swiper",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 37, 54),
      ),
      body: Center(
        child: Container(
          child: swiper(),
        ),
      ),
    );
  }
}

/// acá nos vamos a crear la función que nos permitirá hacer el swiper
/// para lograrlo tuvimos que ir a PUB.DEV flutter_swiper y agregar este paquete
/// para agregar un paquete vamos a "pubspec.yaml" y en la parte de dependencies
/// dependencies:
///   flutter:
///      sdk: flutter
/// a la altura de flutter: ponemos :
///   flutter_swiper: ^1.1.6
/// ahora hay que importarlo al proyecto en la parte de arriba

Widget swiper() {
  /// acá creamos la lista
  List<String> imagenes = [
    "https://images.unsplash.com/photo-1585468491047-f02d6f7c706c?q=80&w=1035&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://www.blogdelfotografo.com/wp-content/uploads/2023/09/paisajes-1.webp",
    "https://images.squarespace-cdn.com/content/v1/5e10bdc20efb8f0d169f85f9/09943d85-b8c7-4d64-af31-1a27d1b76698/arrow.png?format=1000w",
    "https://upload.wikimedia.org/wikipedia/commons/9/9e/Random_Turtle.jpg",
    "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1569974507005-6dc61f97fb5c?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];
  return Container(
    /// double.infinity toma todo el ancho de la pantalla
    width: double.infinity,
    height: 250.0,
    child: Swiper(
      /// el view point fraction permite que veamos un poco lo que hay en la sig imagen
      viewportFraction: 0.8,
      scale: 0.8,

      /// todo lo de acá lo copiamos tal cual de Flutter
      /// como tenemos el index, eso es para trabajar con listas

      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          imagenes[index],
          fit: BoxFit.fill,
        );
      },
      /// para modificar la cantidad de fotos que veo se define acá 
      itemCount: imagenes.length,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    ),
  );
}
