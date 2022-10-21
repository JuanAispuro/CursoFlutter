import 'package:curso_flutter_basico/models/persona_model.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_basico/ui/ui.pages/detallecontacto_page.dart';

class CustomListTile extends StatelessWidget {
  final Personamodelo person;
  CustomListTile({required this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return DetallesContactoPage(persona: person,
          contenido: person.nombre.contains("Valeria")? "Nuevo Contenido": "Nuevo Contenido");
        }));
       
      },
      // no existe setstate para los statelesswidget
      trailing: SizedBox(
        //Sizedbox padre
        width: 100.00,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(person.iconderecha),
            SizedBox(width: 8.00),
            Icon(Icons.call)
          ],
        ),
      ),
      leading: Icon(person.iconizquierda),
      title: Text(person.nombre),
      subtitle: Text(person.description),
    );
  }
}
