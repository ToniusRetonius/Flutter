import 'package:cloud_firestore/cloud_firestore.dart';

// db = database
FirebaseFirestore db = FirebaseFirestore.instance;

/// vamos a querer obtener info (lectura)

Future<List> getPeople() async {
  List people = [];

  /// como podríamos tener muchas colecciones en la base de datos, tenemos que hacer referencia a aquella que necesitamos
  /// lo logramos con un objeto llamado CollectionReference .. este se puede obtener con el metodo .collection('nombre de referencia') de la clase FirebaseFirestore
  CollectionReference collectionReferencePeople = db.collection('people');

  /// ahora necesitamos hacer la QUERY
  /// para que nos traiga todos los documentos que hay guardados en la colección : People
  /// esto nos trae todo y puede tardar y costar muchos recursos, después vamos a ver cómo limitar este .get () para ser más específicos con la consulta
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  /// una vez que los tengo todos, con un FOREACH () recorro la lista de docs
  for (var documento in queryPeople.docs) {
    /// acá podemos hacer algo
    /// en este caso lo vamos a agregar a la lista
    /// nos creamos una variable que guarde el documento como una variable de tipo Map<String, dynamic> para poder manejar la información con esta estructura es como un diccionario clave str valor dynamic
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;

    /// nos creamos la variable persona como un objeto con una cierta estructura
    final person = {
      "name": data['name'],
      "uid": documento.id,
    };

    people.add(person);
  }

  /// atrasamos voluntariamente la carga para asegurarnos que todo aparezca al mismo tiempo
  Future.delayed(const Duration(seconds: 5));

  return people;
}

/// vamos a querer mandarle info capturada en la app y guardarla en la base de datos
/// vamos a devolver void porque por el momento nos interesa subir la info y nada más, podríamos también querer capturar un booleano si se cargó en la db ...  etc
/// en async porque necesitamos esperar a que se guarde el proceso, que la base de datos guarde

Future<void> addPeople(String name) async {
  /*  es importante notar la estructura de dato de nuestra collección 
  {
    "people": [
      {
        "name": Toto
      },
      {
        "name": Ari
      }, 
      {...}, 
    ]
  } 
  para poder entender qué le estamos pasando al .add()
  */
  await db.collection("people").add({"name": name});
}

/// método para actualizar la base de datos

Future<void> updatePeople(String uid, String newName) async {
  /// en el .doc le digo qué documento quiero modificar (recordar que tienen un id)
  /// con el método set le pasamos el "name" nuevo
  await db.collection("people").doc(uid).set({"name": newName});

  /// y listo, actualizamos el valor
}

/// método para eliminar personas
/// vamos a necesitar su id como parámetro para eliminarlo
Future<void> deletePeople(String uid) async {
  await db.collection("people").doc(uid).delete();
}
