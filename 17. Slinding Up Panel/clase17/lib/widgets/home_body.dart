import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<String> personas = ['Marco Aurelio', 'Tomás Melli', 'Maca Melli'];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
        /// queremos devolver la cantidad de personas que tengo
        itemCount: personas.length,
        itemBuilder: (BuildContext comtext, int index) {
          return ListTile(
            title: Text(personas[index]),
            /// leading : me permite poner al principio un elemento
            leading: CircleAvatar(
              child: Text(personas[index].substring(0,1)),
            ),
            /// trailling : nos agrega un elemento al final
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
    ));
  }
}
