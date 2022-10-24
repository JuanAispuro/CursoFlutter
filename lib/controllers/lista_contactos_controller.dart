import 'package:curso_flutter_basico/models/persona_model.dart';
import 'package:flutter/cupertino.dart';

class ListaContactosController{


  //Valores volviendose static
  static List<Personamodelo> persons = [
    persona1,
    persona2,
    persona3,
    persona2,
  ];

  //retornamos el constructor con una instancia.
  static ListaContactosController instancia = ListaContactosController._();
  //Constructor privado (Singletone)
  ListaContactosController._();

  //Agregaremos valores notifier
  //Este va a ser tipo Lista PersonaModelo
  ValueNotifier<List<Personamodelo>> contactos = ValueNotifier<List<Personamodelo>>(persons);
}