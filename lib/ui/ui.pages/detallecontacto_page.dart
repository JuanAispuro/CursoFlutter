import 'package:curso_flutter_basico/models/persona_model.dart';
import 'package:flutter/material.dart';

class DetallesContactoPage extends StatelessWidget {
  final Personamodelo persona;
  final String contenido;

  DetallesContactoPage({required this.persona, this.contenido = "Contenido"});
  @override
  Widget build(BuildContext context) {
    //instanciar un objeto de detallescontactopagearguments
    return Scaffold(
        appBar: AppBar(
          title: Text(persona.nickName!),
          centerTitle: true,
        ),
        body: Center(
          child: Text(contenido),
        ));
  }
}
