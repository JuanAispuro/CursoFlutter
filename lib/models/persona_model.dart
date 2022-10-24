import 'package:flutter/material.dart';

//Aqui pondremos una clase de la información para nuestro widget
//icondata ocupa importar los datos
class Personamodelo {
  //Atributos principales
  IconData? iconizquierda;
  IconData? iconderecha;
  String? nombre;
  String? description;
  String? nickName;
  String? telefono;

  Personamodelo(
      {this.description,
      this.iconderecha,
      this.iconizquierda,
      this.nombre,
      this.nickName,
      this.telefono});
}

Personamodelo persona1 = Personamodelo(
    nombre: 'Juan Armando',
    description: 'Hola, soy Juan Armando',
    iconderecha: Icons.message,
    iconizquierda: Icons.person,
    nickName: 'Juancho',
    telefono: '6642043777'

    //error nickname data == null
    );
Personamodelo persona2 = Personamodelo(
    nombre: 'Valeria Mendez',
    description: 'Ly<3',
    iconderecha: Icons.message,
    iconizquierda: Icons.person,
    nickName: 'Amors',
    telefono: '6671920411'

    //error nickname data == null
    );
Personamodelo persona3 = Personamodelo(
    nombre: 'Mi gran Familia',
    description: 'Jose pablo: Ya sali',
    iconderecha: Icons.message,
    iconizquierda: Icons.person,
    nickName: 'Grupo',
    telefono: '6679953774'

    //error nickname data == null
    );
