import 'package:curso_flutter_basico/models/persona_model.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_basico/ui/ui.pages/detallecontacto_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomListTile extends StatelessWidget {
  final Personamodelo person;
  CustomListTile({required this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return DetallesContactoPage(persona: person,
          contenido: person.nombre!.contains("Valeria")? "Nuevo Contenido": "Nuevo Contenido");
        }));
       
      },
      // no existe setstate para los statelesswidget
      trailing: SizedBox(
        //Sizedbox padre
        width: 100.00,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(icon: Icon(MdiIcons.whatsapp), onPressed: () {
              launch("https://wa.me/+52${person.telefono}?text='hola'");
            }),
            IconButton(icon: Icon(MdiIcons.phone), onPressed: () {
              //mandar comando con launch.
              launch("tel:${person.telefono}");
            }),
          ],
        ),
      ),
      //Para agregar aun lado de nuevo contacto
      leading: CircleAvatar(child: Text(
        //Con esto se pone aun lado la primera letra del nombre.
        person.nombre![0].toUpperCase()),
        ),
      title: Text(person.nombre ?? ""),
      subtitle: Text(person.nickName ?? ""),
    );
  }
}
