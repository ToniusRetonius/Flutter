// ignore_for_file: non_constant_identifier_names

/* dentro de este servicio vamos a importar el paquete para poder utilizarlo */
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/* hacemos la instancia de nuestro paquete con  */
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/* hacemos una función para declarar las constantes de inicialización de ambos sistemas operativos y poder inicializarlas con el objeto : 
  'const InitializationSettings initializationSettings'

por ejemplo el ícono que lo tenemos que agregar en ANDROID > APP > SRC > MAIN > RES > DRAWABLE y darle un nombre como por ejemplo 'app_icon' */
Future<void> initNotifications() async {
  /* en este caso arrancamos con ANDROID */
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('icono_notificacion');

  /* para iOS no es necesario lo del ícono pues utiliza la de la app */
  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  /* tenemos que crear el objeto que utilice estas constantes */
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

}

/* vamos a crear un método que nos permita levantar la notificación */
Future<void> mostrarNotificacion () async {
  /* para ANDROID */
  const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
    'your channelId', 
    'your channelName', 
    /* podemos definir la importancia y la prioridad */
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    ticker: 'ticker');
  /* de channel ID o Name podemos poner cualquier cosa que sea STR */

  /* para iOS :: no necesita nada de channel id ni name */
  /* const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(); */

  /* creamos el objeto */
  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    /* iOS: darwinNotificationDetails, */
  );

  /* tenemos que ejecutar la notificación ahora */
  await flutterLocalNotificationsPlugin.show(
    0, 
    'acá va el título', 
    'acá va el body de la notificación', 
    notificationDetails,
    payload: "item x");

}