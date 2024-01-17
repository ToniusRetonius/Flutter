// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
/* Para hacer la validación necesitamos crear un estado global que nos permita saber el estado del formulario en cada momento  */
  final GlobalKey<FormState> estado_form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      /// vemos el form
      padding: EdgeInsets.all(10),
      child: Form(

          /// para capturar ese estado ponemos en KEY : la variable
          key: estado_form,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Color.fromARGB(255, 12, 0, 54))),

                  /// no conviene usar textfield acá pues no está relacionado al widget form y por tanto las validaciones se hacen por cada uno TextField(), por ello usamos el ....
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ingrese su correo..."),
                    validator: (value) {
                      /// usamos el '!' al final para simbolizar que sí o sí tiene un estado la variable
                      /// lo usamos al principio como negación
                      /// lo ideal es buscar una forma regular en internet y validar todo
                      if (!value!.contains("@")) {
                        return "El correo no es válido";
                      }
                      /// si devuelve un STRING es porque falló la validación

                      return null;
                      /// si devuelve null, está todo bien
                    },
                  )),
              
              SizedBox(height: 10,),

              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Color.fromARGB(255, 12, 0, 54))),

                  /// no conviene usar textfield acá pues no está relacionado al widget form y por tanto las validaciones se hacen por cada uno TextField(), por ello usamos el ....
                  child: TextFormField(

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ingrese su contraseña..."),
                    
                    /// como se trata de una constraseña queremos que no se vea lo que se escribe
                    obscureText: true,

                    validator: (value) {
                      /// usamos el '!' al final para simbolizar que sí o sí tiene un estado la variable
                      /// lo usamos al principio como negación
                      /// lo ideal es buscar una forma regular en internet y validar todo
                      if (value!.length < 6) {
                        return "La contraseña debe tener al menos 6 caracteres";
                      }
                      /// si devuelve un STRING es porque falló la validación

                      return null;
                      /// si devuelve null, está todo bien
                    },
                  )
                ),
              
              /// usamos el expanded para llevar al final el botón
              Expanded(child: Container()),

              /// lo grandioso de este TextFormField es que sólo un botón te permite comprobar la info
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (estado_form.currentState!.validate()) {
                        /// realizamos el resto del proceso (enviar la info al backend por ejemplo)
                      } else {
                        print("Hay errores");
                      }
                    },
                    child: Text("Enviar")),
              ),
            ],
          )),
    );
  }
}
