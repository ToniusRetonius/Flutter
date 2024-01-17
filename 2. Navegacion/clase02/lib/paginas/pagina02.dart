// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Pagina02 extends StatelessWidget {
  const Pagina02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Terminos y Condiciones"),
        backgroundColor: Color.fromARGB(135, 241, 216, 115),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:Column(
          
          children: [
          
          Text("Términos y Condiciones", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          
          
          Text("Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones", style: TextStyle(fontSize: 14),),

          /// con la sized box le damos altura para separar estos textos
          SizedBox(height: 10.0,),

          Text("Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones.Si desea utilizar esta aplicación debe aceptar los términos y condiciones", style: TextStyle(fontSize: 14),),
          

          Text("Está de acuerdo?", textAlign: TextAlign.center,),

          TextButton(
            onPressed: ()=>{
              print("Efectivamente sí")
          },
            child: Text("Sí")),

          TextButton(
            onPressed: ()=>{
              print("Efectivamente No")
          }, 
            child: Text("No")),

          TextButton(
            onPressed: ()=> {
              /// acá podríamos guardar un regitro en una base de datos 
              /// antes de hacer el POP 
              Navigator.pop(context)
            }, 
            child: Row(children: [
              Text("Acepto Todo", style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
              Icon(Icons.arrow_forward),
            ],)
            ),

            FilledButton(
              onPressed: ()=>{}, 
              child: Text("Soy un botón"),),
   
      
        ]),
      ),
    );
  }
}