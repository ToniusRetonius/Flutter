// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// importamos el servicio
import 'package:firebase_basics/servicios/services.dart';

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
          backgroundColor: const Color.fromARGB(255, 43, 0, 43),
          title: const Text(
            'Firebase',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
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
                    /// aprendemos un nuevo widget que nos permite desplazar elementos hacia los costados y los borra a la vista pero no lo borra como dato (sólo oculta)
                    return Dismissible(
                      /// para cada elemento hay un key específico e única
                      key: Key(snapshot.data?[index]['uid']),

                      background: Container(
                        color: const Color.fromARGB(255, 43, 0, 43),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      /// puedo definir la dirección en la cual puedo hacer el dismissible
                      direction: DismissDirection.endToStart,

                      /// la función confirmdismiss nos permite implementar una función con esa acción
                      /// la idea será eliminar aquella información
                      confirmDismiss: (direction) async {
                        /// este método tiene que tener un true para que funcione como tal, por ello me armo la variable booleana que me interesará setear cuando el usuario decida algo
                        /// eso lo hacemos con una espera de una pregunta al usuario con la función AlertDialog
                        bool result = false;

                        result = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "¿Está seguro que desea eliminar el registro de ${snapshot.data?[index]['name']}?"),

                                /// con la función actions le damos opciones
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        /// .pop toma otro parámetro además del context y puede ser un false ... en ese caso el usuario decidió NO eliminarlo
                                        return Navigator.pop(context, false);
                                      },
                                      child: const Text("Cancelar")),
                                  TextButton(
                                      onPressed: () {
                                        /// .pop toma otro parámetro además del context y puede ser un false ... en ese caso el usuario decidió NO eliminarlo
                                        return Navigator.pop(context, true);
                                      },
                                      child: const Text("Sí, estoy seguro")),
                                ],
                              );

                              /// pero hasta el momento sólo capturamos la decisión del usuario pero no la repercusión en mi base de datos
                              /// para realmente eliminarlo usamos la propiedad ONDISMISSED
                            });

                        return result;
                      },

                      /// el DISMISSIBLE tiene una propiedad llamada onDismissed que me permite capturar el momento posterior a la eliminación de la UI
                      /// esto nos permitirá ejecutar una función
                      onDismissed: (direction) async {
                        /// acá eliminamos en la db
                        /// nos vamos a servicios y hacemos esa función que la elimina
                        await deletePeople(snapshot.data?[index]['uid']);
                      },

                      child: ListTile(
                        /// usamos el ListTile que arma un componente alrededor del texto y con ese onTap podemos controlar qué pasa con ese nombre
                        title: Text(snapshot.data?[index]['name']),

                        onTap: () async {
                          /// el pushNamed también puede recibir un parámetro llamado ARGUMENTS como un nombre
                          /// ese nombre hace referencia al nombre que quiero editar... y ahora tenemos que recibirlos en el BUILD de la página edit
                          await Navigator.pushNamed(context, '/edit',
                              arguments: {
                                'name': snapshot.data?[index]['name'],
                                'uid': snapshot.data?[index]['uid']
                              });
                          setState(() {});
                        },
                      ),
                    );
                  });
            } else {
              /// tenemos que controlar los milisegundos que tarda en llegar y por tanto metemos un CircularProgressIndicator
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),

        /// acá ponemos el floationg button que me abre el textfield para ingresar la data que vamos a querer guardad
        /// luego de la captura de la info necesitamos que espere la guarda en la db y que vuelva esa info nueva, por ello, este proceso se vuelve ASYNC
        /// en otras palabras, espera a que nosotros GUARDEMOS lo que pusimos en el textfield, si es que no pusimos nada, no importa
        /// tenemos que ACTUALIZAR el estado con SetState
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/add');
            setState(() {});
          },
          child: const Icon(Icons.add),
        ));
  }
}

/*   
  ?: Se usa para permitir que una expresión sea nula y manejarla de manera segura sin lanzar excepciones.
    
  !: Se usa para afirmar que una expresión no es nula, incluso si el sistema de tipos indica lo contrario. Puede resultar en una excepción si la expresión es nula. 
*/

/* User
════════ Exception caught by widgets library ═══════════════════════════════════
A dismissed Dismissible widget is still part of the tree.

si aparece este error es por que la db tarda en realizar upload, change, delete entonces no podés crear un nombre y al instante querer eliminarlo... es como que le tenés que dar tiempo 

 */