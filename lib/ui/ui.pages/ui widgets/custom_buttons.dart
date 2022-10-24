import 'package:curso_flutter_basico/controllers/main_controller.dart';
import 'package:curso_flutter_basico/controllers/theme_controller.dart';
import 'package:curso_flutter_basico/ui/ui.pages/Home_page.dart';
import 'package:curso_flutter_basico/ui/ui.pages/form_contacto_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  //Escucha la información
  //Clases y objetos.
  ValueNotifier<String> titulo = ValueNotifier<String>("Agregar Contacto");
  ThemeController _controller = ThemeController.instancia;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //El gesture detector hace más para presionarlos.
      //inkwell nomas un presionado y  presionado largo
      //inkell puede usar tambien material design como su despliegue y naturalez.
      onTap: () {
        presionadDeBoton();
        // titulo.value = "Value notifier button";
        // _controller.ChangeTheme(true);
        //widget para navegar entre pantallas.
        //push ingresar una nueva ruta
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return FormContactoPage();
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FormContactoPage();
        }));
      },
      //widget valueListablebuilder[permite adicionar un pequeno notificador]
      child: ValueListenableBuilder(
        valueListenable: titulo,
        builder: (context, value, child) {
          return Container(
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  //Con theme of context, nos referimos al tema del contexto.
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(8.0)),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  //Para acceder al valor es titulo.value
                  value,
                  //Usando la libreria de google fonts
                  style: GoogleFonts.biryani(
                    color: Theme.of(context).primaryColor, fontSize: 20.0)
                  )
                ),
              );
        },
    ));
  }
}
