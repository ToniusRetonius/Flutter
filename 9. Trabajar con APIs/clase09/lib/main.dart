// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_const_declarations, non_constant_identifier_names

import 'dart:convert';

import 'package:clase09/modelos/Gif.dart';
import 'package:flutter/material.dart';

/// importamos el paquete y que me lo encapsule en el objeto http
import 'package:http/http.dart' as http;

/// en esta clase vamos a ver cómo descargar dependecias y usarlas
/// y con GIPHY dev vamos a crearnos la cuenta y ver cómo funciona

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// veremos que hacer consultas a internet toma tiempo
  /// el Objeto Future nos permite esperar hasta que se resuelva la petición

  late Future<List<Gif>> lista_gifs;

  /* Marcar la variable como late para indicar que será inicializada en algún momento antes de ser utilizada.
  Esta es una solución común cuando estás seguro de que la variable será inicializada antes de ser utilizada. */

  /// para obtener esos valores necesito una función que los fetchee
  Future<List<Gif>> getgifs() async {
    /// http.get(url) me pide una url entonces la vamos a buscar a la API
    final String apiUrl =
        "https://api.giphy.com/v1/stickers/trending?api_key=jmMREI66QM6NGnwiGhG0pdKiunJh9T4U&limit=25&offset=0&rating=g&bundle=messaging_non_clips";

    final respuesta = await http.get(Uri.parse(apiUrl));

    /// me interesará capturar el estado de la respuesta para ello
    /// inicializo una lista vacía
    List<Gif> gifs = [];

    if (respuesta.statusCode == 200) {
      /// statuscode = 200 significa petición aceptada
      /// ponemos el print para ver en consola si la data llega
      ///print(respuesta.body);

      /// body tiene toda la data que quiero capturar
      /// esto no es obligatorio pero puede suceder que la API me devuelve info codificada en UTF8 (como palabras con tilde o ñ) y pueden aparecer signos raros
      String body = utf8.decode(respuesta.bodyBytes);

      /// después necesitamos convertir esto a JSON
      /// al final del código está la explicación de qué es y por qué nos importa este formato

      final jsonData = jsonDecode(body);

      /// tenemos que ver qué info tenemos en jsonData
      /// para eso hacemos el print
      /// si le pedimos una clave particular lo hacemos como se ve en el ejemplo
      /// y si queremos un índice en particular, como siempre
      /// de esta manera navegamos por los objetos JSON en Flutter
      /// print(jsonData['data'][0]);
      /// como Data es una lista, nosotros la vamos a recorrer y vamos a buscar los gif

      for (var item in jsonData['data']) {
        gifs.add(

            /// acá vamos a recorrer el objeto JSON y en cada iteración vamos a capturar la info necesaria para construir nuestro Objeto GIF ( con su constructor que toma GIF(NAME, URL))
            /// ese objeto capturado se va a guardar en la lista 'gifs' creada vacía por fuera de esta función
            /// de dónde sacamos los índices? Cuando hacemos el print por consola nos aparece el objeto JSON con sus claves y a partir de allí elegimos qué info traernos
            Gif(item['title'], item['images']['original']['url']));
      }

      /// finalmente retorno la lista
      return gifs;
    } else {
      /// capturamos el error
      throw Exception("Falló la conexión!");
    }
  }

  /// cuando se abre una ventana, initstate es lo primero que se ejecuta
  @override
  void initState() {
    super.initState();

    /// la lista de gifs que quiero capturar será
    lista_gifs = getgifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Manejando API",
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Trabajando con una API",
              style: TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
            ),
            backgroundColor: Color.fromARGB(221, 46, 39, 0),
          ),

          /// vemos un nuevo Widget ( el FUTURE BUILDER)
          body: FutureBuilder(
            future: lista_gifs,
            builder: (context, snapshot) {
              /// el snapshot toma la info que me devuelve mi 'future:'
              /// si tiene info capturada, hacemos algo, si tiene un error lo imprimimos
              if (snapshot.hasData) {
                /* return ListView(
                  /* utilizamos el operador de postfijo de "no nulo" (!) para indicarle al compilador que estamos seguros de que snapshot.data no es nulo */
                  children: listGifs(snapshot.data!),
                ); */

                 /* otra manera de visualizar esto es */
                  return GridView.count(
                    crossAxisCount: 2,
                    children: listGifs(snapshot.data!)
                  );
                   
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("Hay un error");
              }

              /// no peude retornar null por tanto metemos el circulito de cargando mientras sucede alguno de los dos estados posibles (carga correcta o error)
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}

List<Widget> listGifs(List<Gif> data) {
  /// me quiero guardar los que quiero mostrar
  List<Widget> gifs = [];

  /// data es de tipo Lista de Gif
  /// quiero capturar el nombre y guardarlo en el Widget Text()
  for (var gif in data) {
    gifs.add(Card(
        child: Column(
      children: [
        /// para evitar errores en la visualización 
        Expanded(child: Image.network(gif.url, fit: BoxFit.fill,)),
      ],
    )));
  }

  return gifs;
}

/// respuesta sobre qué es JSON de chatgpt
/*       JSON (JavaScript Object Notation) es un formato ligero de intercambio de datos que es fácilmente legible para los humanos y fácilmente parsable para las máquinas. Es utilizado comúnmente para transmitir datos entre un servidor y una aplicación web o móvil, ya que es un formato de texto simple y estructurado.

Las estructuras de datos en JSON se componen de pares clave-valor, donde una clave es una cadena y un valor puede ser una cadena, un número, un booleano, un objeto JSON, un array o null. Aquí hay un ejemplo básico de una estructura JSON:

json

{
  "nombre": "Juan",
  "edad": 25,
  "ciudad": "Ejemploville",
  "casado": false,
  "hobbies": ["leer", "correr", "programar"],
  "direccion": {
    "calle": "123 Calle Principal",
    "ciudad": "Ciudad Ejemplo",
    "codigo_postal": "12345"
  }
}

En el ejemplo anterior, "nombre", "edad", "ciudad", "casado", "hobbies" y "direccion" son claves, y los valores asociados son cadenas, números, booleanos, arrays o incluso otros objetos JSON.

En Flutter, puedes trabajar con datos JSON utilizando la clase json que se encuentra en el paquete dart:convert. Este paquete proporciona funciones para convertir objetos Dart a JSON y viceversa. Por ejemplo, puedes usar json.encode() para convertir un objeto Dart a una cadena JSON y json.decode() para convertir una cadena JSON de nuevo a un objeto Dart. */

/// variables de tipo FINAL
/* En Dart, cuando declaras una variable con la palabra clave final, estás indicando que el valor de esa variable no puede cambiar una vez que ha sido asignado. Es decir, una vez que has asignado un valor a una variable final, ese valor no puede ser modificado durante la ejecución del programa. */
