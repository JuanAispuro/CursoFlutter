import 'package:curso_flutter_basico/controllers/lista_contactos_controller.dart';
import 'package:curso_flutter_basico/models/persona_model.dart';
import 'package:curso_flutter_basico/ui/ui.pages/Home_page.dart';
import 'package:curso_flutter_basico/ui/ui.pages/ui%20widgets/custom_buttons.dart';
import 'package:curso_flutter_basico/ui/ui.pages/ui%20widgets/custom_liststyle.dart';
import 'package:flutter/material.dart';


class ListaContactosPage extends StatelessWidget {

  //Creamos el objeto con la instancia.
  ListaContactosController controller = ListaContactosController.instancia;
  @override
  Widget build(BuildContext context) {
    //retornaremos el ValueListenableBuilder para oirlo
    return ValueListenableBuilder(
      //Teniendo acceso a la lista de contactos.
      valueListenable: controller.contactos,
      builder: (context, value, child) {
        return  Container(
    child: Column(
    children: <Widget>[
      CustomButton(), //Ahora es un  clase.
      Expanded(
        child: ListView.builder(
          //contar items (en este caso las personas.)
          itemCount: value.length,
          itemBuilder: (context, picker) {
            return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction) => value.removeAt(picker),
                //Ponemos la posición o otro elemento por ejemplo es normal
                //El id.
                key: Key(picker.toString()),
                child: CustomListTile(person: value[picker]));
                    },
                  ),
                )
              ],
            ));
      },
    );
  }
}