// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

///  main es la función primera que ejecuta la app 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// MaterialApp es un patron de diseño con sus atributos
      title: "MyApp",
      /// inicio será un elemento de tipo stateful
      home: Inicio(),
    );
  }
}
///StatelessWidget:
///Es inmutable y no puede cambiar después de ser creado.
///No tiene un estado interno mutable ni métodos que puedan cambiar su apariencia.
///Se utiliza cuando la parte visual de la interfaz de usuario no cambia en respuesta a la interacción del usuario o a cambios en los datos.

///StatefulWidget:
///Puede cambiar su aspecto a lo largo del tiempo en respuesta a interacciones del usuario o cambios en los datos.
///Tiene un objeto State asociado que puede contener datos mutables y métodos para cambiar esos datos.
///Se utiliza cuando la parte visual de la interfaz de usuario necesita actualizarse dinámicamente.
///
class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// estructura clásica de apps
      appBar: AppBar(
        // la appbar tiene atributos también
        title: Text("Mi app", 
        style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, ), 
          textAlign: TextAlign.right),
      backgroundColor: Color.fromARGB(255, 4, 48, 8),
      ),
    /// tenemos la prop Body
    /// hay widgets que existen para contener otros.. en este caso Container
    /// puedo darle color al fondo
      backgroundColor: Color.fromARGB(255, 215, 255, 233),
      
    body: ListView(
          /// qué pasa si queremos muchas imágenes? usamos Column( children: <Widget>[ Container(), y poner varios Container ()])
          /// el problema que puede ocurrir es que de tanto agregar no me deje ver las fotos en la pantalla del celular, para arreglarlo usamos ListView
      children: [
        Container(
          /// para el caso de container tenemos muchas props
          /// padding es el espacio entre el borde y la imagen, el valor que toma es de tipo FLOAT
          padding: EdgeInsets.all(60.0),
          child: Image.network("https://img.freepik.com/foto-gratis/resumen-bombilla-creativa-sobre-fondo-azul-brillante-ia-generativa_188544-8090.jpg?w=740&t=st=1704228451~exp=1704229051~hmac=64478a882491196cfe65b3d53e2b685f95dbda571b2911e181695f1055b570d3"),
          ),
          Container(
            padding: EdgeInsets.all(60.0),
            child: Image.network("https://img.freepik.com/foto-gratis/resumen-bombilla-creativa-sobre-fondo-azul-brillante-ia-generativa_188544-8090.jpg?w=740&t=st=1704228451~exp=1704229051~hmac=64478a882491196cfe65b3d53e2b685f95dbda571b2911e181695f1055b570d3"),
          ),
          Column(
            /// alineación de la columna en el eje vertical ( tiene lo mismo que Row)
            mainAxisAlignment: MainAxisAlignment.center,
            /// tamaño de la columna .max o .min (en casi de ser max ocupa todo el espacio disponible)
            mainAxisSize: MainAxisSize.max,
            /// crossAxis es el eje horizontal
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Container(
                // al container le damos como contexto toda la app, le pedimos el ancho, y le damos todo ese espacio
                width: MediaQuery.of(context).size.width,
                /// Si queremos centrarlo en el atributo Text, usamos textAlign : 
                child: Text("Soy un texto en la columna centrado", textAlign: TextAlign.center,),
              ),
              Container(
                width: MediaQuery.of(context).size.width ,
                child: Text("Hola mundo", textAlign: TextAlign.center,),
              )
            ],
          ),

          Row(
            /// alineación de la fila (start : principio , end : final, spaceAround : rellena el espacio entre los textos , spaceBetween : ubica todo el espacio libre entre los textos, spaceEvenly : iguala espacios entre textos y bordes)
            mainAxisAlignment: MainAxisAlignment.start,
            /// tamaño de la fila .max o .min (en casi de ser max ocupa todo el espacio disponible)
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Soy un texto en la fila alineado al principio"),
              /// se rompe con el tamaño de la app
              ///Text("Soy otro texto en la fila"),
            ],
          ),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: ()  { print("Me apretaste!");},
                child: Text("Soy un text Button")),
                
              OutlinedButton(onPressed: ()  { print("Me apretaste!");} , child: Text("Soy un Outlined button")),
              ElevatedButton(onPressed: () { print("Me apretaste!");} , child: Text("Soy un Elevated button")),
              /// para el caso del Icon puedo darle un Icon. y buscar ahí
              IconButton(
                onPressed: () { 
                /// acá podemos crearnos una función y hacer algo más complejo
                var t = TimeOfDay.now();
                print(t);
                }, 
                icon: Icon(Icons.timer)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: ()  { print("Ya lo mandamo... ay despacito!");}, icon: Icon(Icons.rocket)),
              IconButton(onPressed: ()  { print("Hola Ari!");}, icon: Icon(Icons.person_2_rounded)),
              IconButton(onPressed: ()  { print("Me apretaste!");}, icon: Icon(Icons.disc_full_rounded)),
            ],

          ),
      ],
      
    ),
    );
  }
}

/// vamos a crear una función que me devuelva un widget
///  la idea será crear el cuerpo de la app donde el usuario pueda hacer el sign in y completar cosas
///  esto nos ayuda a modularizar el código y tenerlo limpio
Widget cuerpo(){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://previews.123rf.com/images/simpleline/simpleline2302/simpleline230210137/198852397-una-sola-l%C3%ADnea-de-dibujo-mujer-belleza-cara-abstracta-peinado-ilustraci%C3%B3n-vectorial-de-moda.jpg"),
        fit: BoxFit.cover,
        )
      ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          nombre(),
          campo_usuario(),
        
      ],)
      ),
  );
}

Widget nombre(){
  return Text("Sign in", 
  style: TextStyle(
    color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
    );
}

Widget campo_usuario(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

    child: TextField(
      decoration: InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campo_password(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

    child: TextField(
      /// para el caso de contraseña no queremos que se vea el texto => 
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );  
}

Widget boton_entrada(){
  return TextButton(
    onPressed: () {}, 
    child: Text("Entrar", )
    );
}
/// la sized box nos ayuda a separar los widgets
/// SizedBox(height: 10,),
/// si quisiesemos modularizar los archivos de la app podemos usar uno llamado widgets.dart donde podríamos ir codeando uno por uno y luego ubicarlos en el main.

