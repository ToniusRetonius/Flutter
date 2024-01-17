// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormCard extends StatefulWidget {
  const FormCard({super.key});

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {

  /// nos traemos la variable de la librería mask text formatter
  /// en la parte de mask, pasamos el formato
  /// en la parte de filter, dice que # representa un número entre 0-9
var cardMask = new MaskTextInputFormatter(
  mask: '#### #### #### ####', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

var dateMask = new MaskTextInputFormatter(
  mask: '##/##', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

var codeMask = new MaskTextInputFormatter(
  mask: '###', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      /// el singlechildscrollview lo que nos permite es que si el teclado te oculta algún widget, puedas scrollear y mirarlo bien
      child: Column(
        children: [
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-Lc0Bvgl4nBeux3fpv_PIaJuzHWrb1MtBV8ULJc1DAULy8Nr6iFeXB6O-_Q&s"),
          SizedBox(height: 20,),
      
          /// acá va el nombre
          input_nombre(),
          SizedBox(height: 20,),

          input_tarjeta(),
          SizedBox(height: 20,),
      
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: input_fecha(), 
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: input_codigo(), 
              )
            ],
          ),
          SizedBox(height: 20,),

          Container(
            margin: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width - 30,
            child: ElevatedButton(
              onPressed: (){}, 
              child: Text("Pagar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 58, 23, 0),
                foregroundColor: Colors.white,
              ),
              ),
            
          )
        
        ],
      ),
    );
  }

  Container input_nombre() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          /// dado que el código de seguridad son 3 dígitos, con maxlength puedo restringir cuántos ingresan
          /// el tema es que si lo dejo así hay un contador feo por default
          /// por ello en counter text lo saco
          maxLength: 58,
          decoration: InputDecoration(
            counterText: "",
            hintText: "Ingrese su Nombre...",
          /// esto es para sacarle ese borde que aparece cuando te parás sobre el textformfield
            border: InputBorder.none),
        ),
      );
  }
  Container input_tarjeta() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          /// como las tarjeta son sólo números, usamos KeyboardType
          /// y si queremos que se separen automáticamente en grupos de cuatro?
          /// ya existe una librería llamada MASK TEXT INPUT FORMATTER
          keyboardType: TextInputType.number,
          
          /// acá ponemos el cardMASK
          inputFormatters: [cardMask],
          decoration: InputDecoration(
            
            hintText: "XXXX XXXX XXXX XXXX",
            border: InputBorder.none),
        ),
      );
  }
  Container input_fecha() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [dateMask],
          decoration: InputDecoration(
            hintText: "01/28",
            border: InputBorder.none),
        ),
      );
  }
  Container input_codigo() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [codeMask],
          decoration: InputDecoration(
            hintText: "XXX",
            border: InputBorder.none),
        ),
      );
  }
}
