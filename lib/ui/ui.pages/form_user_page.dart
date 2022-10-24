import 'dart:convert';
import 'dart:io';

import 'package:curso_flutter_basico/services/file_service.dart';
import 'package:curso_flutter_basico/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
//Global keys

GlobalKey<ScaffoldState> PageUsuariokey = GlobalKey<ScaffoldState>();
GlobalKey<FormState> formUsuarioKey = GlobalKey<FormState>();

class FormUsuarioPage extends StatefulWidget {
  @override
  State<FormUsuarioPage> createState() => _FormUsuarioPageState();
}

class _FormUsuarioPageState extends State<FormUsuarioPage> {
  //Controlador de texto
  //nombre, nickname telefono del contacto
  late TextEditingController _nombreController;
  late TextEditingController _NicknameController;
  late TextEditingController _TelefonoController;

  late String path;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: "");
    _NicknameController = TextEditingController(text: "");
    _TelefonoController = TextEditingController(text: "");
    path = "";
  }

  //Para validar
  bool Validateall() {
    if (formUsuarioKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String? validate(String value, String key) =>
      value.isEmpty ? "Inserte su $key" : null;

  @override
  Widget build(BuildContext context) {
    //Nuevapantalla
    return Scaffold(
        key: PageUsuariokey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Nuevo Contacto'),
        ),
        body: SingleChildScrollView(
          child: Form(
            //Agregamos el key
            key: formUsuarioKey,
            //Agregamos padding
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  //Widget de tipo Textormfiled.
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[0-9]'))
                    ],
                    // ---- Validación ----
                    validator: ((value) => validate(value!, "Nombre")),
                    //Si quieres un icon es con Prefixicon
                    //recibir el valor que se esta cambiando [onChanged]
                    //label para identificar.
                    decoration: InputDecoration(
                        hintText: 'Nombre',
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Ej. Juan Armando: ',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor))), //con este le ponemos el color del tema
                    onChanged: (value) => () {},
                    controller: _nombreController,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  //telefono
                  TextFormField(
                    //Tipo de teclado
                    keyboardType: TextInputType.number,
                    //Maximo de Caracteres
                    maxLength: 10,
                    //Mediante un metedo de solamente digitos.
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]'))
                    ],
                    // ---- Validación ----
                    validator: ((value) => validate(value!, "Telefono")),
                    //recibir el valor que se esta cambiando [onChanged]
                    //label para identificar.
                    decoration: InputDecoration(
                        hintText: 'Telefono',
                        prefixIcon: Icon(Icons.call),
                        labelText: 'Ej. (+52) 6642043777 '),
                    onChanged: (value) => () {},
                    controller: _TelefonoController,
                  ),
                  //Container para mostrar las imagenes
                  //Esto es un if
                  path == ""
                      ? SizedBox()
                      : Container(
                          child: Image.file(File(path)),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //Camara
                      OutlinedButton(
                        onPressed: () async {
                          //File service es asincrona asi que lo administramos con un asyc y un await
                          String image =
                              await FileService.getImage(camera: true);
                          setState(() {
                            path = image;
                          });
                        },
                        child: Text('Abrir Camara'),
                      ),
                      //Galeria
                      OutlinedButton(
                        onPressed: () async {
                          String image = await FileService.getImage();
                          setState(() {
                            path = image;
                          });
                        },
                        child: Text('Abrir Galeria'),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  //Boton
                  ElevatedButton(
                    //sintaxis para el stylo del elevatedButton
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      //Seleccionamos la foto
                      File file = File(path);
                      //ahora la convertimos a bits
                      // file.readAsBytesSync();
                      //ahora recibe la lista de bits
                      //Guardamos el archivo en una cadena.
                      String imageConvert =
                          base64Encode(file.readAsBytesSync());

                      //Agregamos el shared preferences, de manera que accederemos al valor del nombre controller.
                      SharedPreferencesServices.writestring(
                          key: 'nombre', value: _nombreController.text);
                      //ahora el siguiente
                      SharedPreferencesServices.writestring(
                          key: 'telefono', value: _TelefonoController.text);
                      SharedPreferencesServices.writestring(
                          key: 'imagen', value: imageConvert);

                      print('Se guardo las preferencias');
                    },
                    child: Text(
                      'Actualizar usuario.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
