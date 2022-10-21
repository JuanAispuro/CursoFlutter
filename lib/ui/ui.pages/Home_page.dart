import 'package:curso_flutter_basico/models/persona_model.dart';
import 'package:curso_flutter_basico/ui/ui.pages/ui%20widgets/custom_buttons.dart';
import 'package:curso_flutter_basico/ui/ui.pages/ui%20widgets/custom_liststyle.dart';
import 'package:flutter/material.dart';

//Creamos una lista con los valores
List<Personamodelo> persons = [
  persona1,
  persona2,
  persona3,
  persona1,
  persona2,
  persona3,
  persona1,
  persona2,
  persona3
];
List<Widget> pages = [
  Container(
      child: Column(
    children: <Widget>[
      CustomButton(), //Ahora es un  clase.
      Expanded(
        child: ListView.builder(
          //contar items (en este caso las personas.)
          itemCount: persons.length,
          itemBuilder: (context, picker) {
            return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction) => persons.removeAt(picker),
                //Ponemos la posición o otro elemento por ejemplo es normal
                //El id.
                key: Key(picker.toString()),
                child: CustomListTile(person: persons[picker]));
          },
        ),
      )
    ],
  )),
  Container(color: Colors.red),
];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titulo = 'Material App';
  late int picker;

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
              ListTile(
                  title: Text('Inicio'),
                  onTap: () {
                    Navigator.pop(context); //Para cerrarlo
                    setState(() {
                      picker = 0;
                    });
                  }),
              ListTile(
                title: Text('Segunda Pantalla'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    picker = 1;
                  });
                },
              )
            ],
          ),
        ),
        //Por la guia de estilo el boton se queda en la parte derecha inferior.
        //(Icon) los iconos relacionados con material desing.
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () {
                //Se tiene que utilizar scaffoldMessenger para el showsnackbar
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Login failed")));
                print('Hola Mundo');
              },
              child: Icon(Icons.add),
            );
          },
        ),
        appBar: AppBar(
          //Acciones
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            IconButton(onPressed: () {}, icon: Icon(Icons.image)),
            IconButton(onPressed: () {}, icon: Icon(Icons.message))
          ],

          ///Background color para el appbar
          //leading(boton en la izquierda.)
          title: Text(titulo),
        ),
        //implementar el cuerpoo con (Body)
        body: pages[picker]);
  }
}

GlobalKey<ScaffoldState> homekey = GlobalKey<ScaffoldState>();
