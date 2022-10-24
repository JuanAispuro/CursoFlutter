import 'package:curso_flutter_basico/controllers/theme_controller.dart';
import 'package:curso_flutter_basico/ui/ui.pages/Home_page.dart';
import 'package:curso_flutter_basico/ui/ui.pages/error_page.dart';
import 'package:curso_flutter_basico/ui/ui.pages/form_contacto_page.dart';
import 'package:curso_flutter_basico/ui/ui.pages/form_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  //Ejecutamos antes que la app
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorPage(details: details);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //this is the root of your application.

  ThemeController _controller = ThemeController.instancia;

  @override
  Widget build(BuildContext context) {
    //Widget Padre
    //Con este widget podemos cambiar el tema de la aplicacion.
    return ValueListenableBuilder(
      valueListenable: _controller.isDark,
      builder: (context, value, child) {
        return MaterialApp(

            routes:{
              'form_usuario':(context) => FormUsuarioPage(),
            },
            title: 'Flutter Demo',
            //Tema de la aplicacion
            theme: ThemeData(
              //Tipo de para el texto del tema
              // textTheme: TextTheme(),
              //Aqui el background color no funciona.
              //brightness: Brightness.light,
              //if ? :
              brightness: value ? Brightness.dark : Brightness.light,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            //Container
            //Scaffold nuevo widget(para implementar el material design)
            //Siend capaz de implementar un navbar.
            home: HomePage());
      },
    );
  }
}

//Flutter iniciar clases con mayusculas
//Debemos retornar un widget por defecto
