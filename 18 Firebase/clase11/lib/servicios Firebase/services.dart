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
  queryPeople.docs.forEach((documento) {
    /// acá podemos hacer algo
    /// en este caso lo vamos a agregar a la lista
    people.add(documento.data());
  });

  /// atrasamos voluntariamente la carga para asegurarnos que todo aparezca al mismo tiempo
  Future.delayed(const Duration(seconds: 5));

  return people;
}