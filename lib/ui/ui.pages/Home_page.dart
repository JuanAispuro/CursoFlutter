import 'package:curso_flutter_basico/services/http_requestservices.dart';
import 'package:curso_flutter_basico/ui/ui.pages/lista_contactos_page.dart';
import 'package:curso_flutter_basico/ui/ui.pages/noticias_page.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_basico/ui/ui.pages/informacion_usuario_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List<Widget> pages = [
  ListaContactosPage(),
  InformacionUusarioPage(),
  NoticiasPage(),
];

GlobalKey<ScaffoldState> homekey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titulo = 'Contactos App';
  late int picker;
  //Nos permitiria ser una función asincrona y le agregamos el async
  //Si retornamos el string
  Future<String> DescargarImagen() async {
    print('Se inicia la descarga de la imagen.');
    //Probar el proceso con un future
    await Future.delayed(Duration(seconds: 2), () {});
    return 'Se termino la descarga de la imagen.';
  }

  @override
  void initState() {
    super.initState();
    picker = 0;
  }
  //key global

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homekey,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                  padding: EdgeInsets.zero, //No tendra padding.
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  )),
              //Inicio
              ListTile(
                  leading: Icon(MdiIcons.homeCircle),
                  title: Text('Inicio'),
                  onTap: () {
                    Navigator.pop(context); //Para cerrarlo
                    setState(() {
                      picker = 0;
                    });
                  }),
              //Usuario
              ListTile(
                leading: Icon(MdiIcons.accountBox),
                title: Text('Usuario'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    picker = 1;
                  });
                },
              ),
              //Noticias
              ListTile(
                  leading: Icon(MdiIcons.newspaper),
                  title: Text('Noticias'),
                  onTap: () {
                    Navigator.pop(context); //Para cerrarlo
                    setState(() {
                      picker = 2;
                    });
                  }),
            ],
          ),
        ),
        //Por la guia de estilo el boton se queda en la parte derecha inferior.
        //(Icon) los iconos relacionados con material desing.
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () async {
                // //Se tiene que utilizar scaffoldMessenger para el showsnackbar
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(SnackBar(content: Text("Login failed")));
                var resultado = await obtenerNoticias();

                //Esto lo revisamos si presionamos el boton de (+);
                if (resultado != null) {
                  print(resultado);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("No hay internet")));
                }
              },
              child: Icon(Icons.add),
            );
          },
        ),
        appBar: AppBar(
          //Acciones
          actions: <Widget>[
            picker == 1
                ? IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushNamed(context, 'form_usuario');
                    },
                  )
                : SizedBox(),
          ],

          ///Background color para el appbar
          //leading(boton en la izquierda.)
          title: Text(titulo),
        ),
        //implementar el cuerpoo con (Body)
        body: pages[picker]);
  }
}
