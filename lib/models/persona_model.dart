import 'package:flutter/material.dart';

//Aqui pondremos una clase de la información para nuestro widget
//icondata ocupa importar los datos
class Personamodelo {
  //Atributos principales
  final IconData? iconizquierda;
  final IconData? iconderecha;
  final String nombre;
  final String description;
  final String nickName;

  Personamodelo(
      {required this.description,
      this.iconderecha,
      this.iconizquierda,
      required this.nombre,
      required this.nickName});
}

 Personamodelo persona1 = Personamodelo(
    nombre: 'Juan Armando',
    description: 'Hola, soy Juan Armando',
    iconderecha: Icons.message,
    iconizquierda: Icons.person,nickName: 'Juancho'

    //error nickname data == null
  );
   Personamodelo persona2 = Personamodelo(
    nombre: 'Valeria Mendez',
    description: 'Ly<3',
    iconderecha: Icons.message,
    iconizquierda: Icons.person,nickName: 'Amors'

    //error nickname data == null
  );
   Personamodelo persona3 = Personamodelo(
    nombre: 'Mi gran Familia',
    description: 'Jose pablo: Ya sali',
    iconderecha: Icons.message,
    iconizquierda: Icons.person,nickName: 'Grupo'

    //error nickname data == null
  );
