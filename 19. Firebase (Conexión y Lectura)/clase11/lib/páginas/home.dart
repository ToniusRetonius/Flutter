// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// importamos el servicio
import 'package:clase11/servicios%20Firebase/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 43, 0, 43),
          title: const Text('Lectura de Firebase', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        ),

        /// por qué metemos un future builder ? porque cuando trabajamos con la base de datos que leemos, es de tipo Future
        body: FutureBuilder(
          /// ejecuta el future y el res va al builder
          future: getPeople(),

          /// en esta sección se agrega un contexto y el snapshot que es el res de Future
          builder: (context, snapshot) {
            /// si queremos devolver la lista que leemos de la db usamos ListView.builder y tenemos varios atributos
            /// como devolver esto toma tiempo por las peticiones y todo el embrollo, tenemos que hacer un hasData
            if (snapshot.hasData) {
              return ListView.builder(

                  /// se explica al final la dif entre ? y ! para manejar el null
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    /* print(snapshot.data?[index]['name']); */
                    return Text(snapshot.data?[index]['name']);
                  });
            } else {
              /// tenemos que controlar los milisegundos que tarda en llegar y por tanto metemos un CircularProgressIndicator
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

/*   
  ?: Se usa para permitir que una expresión sea nula y manejarla de manera segura sin lanzar excepciones.
    
  !: Se usa para afirmar que una expresión no es nula, incluso si el sistema de tipos indica lo contrario. Puede resultar en una excepción si la expresión es nula. 
*/