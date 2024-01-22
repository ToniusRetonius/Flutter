import 'package:flutter/material.dart';

/*  
En esta clase vamos a ver cómo poner el ícono que querramos al momento de querer abrir la app
estos cambios se realizan para cada sistema operativo a parte : 

- para ANDROID vamos a entra en ANDROID > APP > SRC > MAIN > RES y en todas las carpetas que comienzan con MIPMAP vamos a meter nuestro logo
Algunos tamaños comunes son 48x48, 72x72, 96x96, 144x144, y 192x192.

- para iOS lo colocamos en ios/Runner/Assets.xcassets/AppIcon.appiconset

las actualizaciones son :

- para ANDROID en el AndroidManifest.xml

- para iOS en el archivo ios/Runner/Info.plist, la sección <key>CFBundleIcons</key>

finalmente hacemos un flutter clean 
*/
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manejando íconos',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ícono'),
          leading: Image.asset('images/ConectarPropiedad.png', width: 100, height: 100,),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}