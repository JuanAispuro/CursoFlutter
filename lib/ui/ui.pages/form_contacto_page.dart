import 'package:curso_flutter_basico/controllers/lista_contactos_controller.dart';
import 'package:curso_flutter_basico/models/persona_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<FormState> formContactoKey = GlobalKey<FormState>();

//Instanciar para el scaffold
GlobalKey<ScaffoldState> FormPageKey = GlobalKey<ScaffoldState>();

//Clase statefulwidget
class FormContactoPage extends StatefulWidget {
  //Creamos una variable
  late final String? title;
  FormContactoPage({this.title});
  @override
  _FormContactoPageState createState() => _FormContactoPageState();
}

class _FormContactoPageState extends State<FormContactoPage> {
  //Controlador de texto
  //nombre, nickname telefono del contacto
  late TextEditingController _nombreController;
  late TextEditingController _NicknameController;
  late TextEditingController _TelefonoController;

  //Llamamos a la lista
  ListaContactosController _controller = ListaContactosController.instancia;
  //Instanciamos persona modelo
  final Personamodelo _persona = Personamodelo();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: "");
    _NicknameController = TextEditingController(text: "");
    _TelefonoController = TextEditingController(text: "");
  }

  //Para validar
  bool Validateall() {
    if (formContactoKey.currentState!.validate()) {
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
        key: FormPageKey,
        appBar: AppBar(
          centerTitle: true,
          //Esto por que es una función
          title: Text('Nuevo contacto'),
        ),
        body: SingleChildScrollView(
          child: Form(
            //Agregamos el key
            key: formContactoKey,
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
                    onChanged: (value) => _persona.nombre = value,
                    controller: _nombreController,
                  ),

                  //Nickanme
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    //recibir el valor que se esta cambiando [onChanged]
                    //label para identificar.
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp('[0-9]'))
                      ],
                      // ---- Validación ----
                      validator: ((value) => validate(value!, "Nickname")),
                      decoration: InputDecoration(
                          hintText: 'Nickname',
                          labelText: 'Nickname ',
                          prefixIcon: Icon(Icons.person),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      onChanged: (value) => _persona.nickName = value,
                      controller: _NicknameController,
                    ),
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
                    onChanged: (value) => _persona.telefono = value,
                    controller: _TelefonoController,
                  ),
                  SizedBox(height: 32),
                  //Boton
                  ElevatedButton(
                    //sintaxis para el stylo del elevatedButton
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      //Agregamos para que agregue el contacto
                      _controller.contactos.value =
                          List.from(_controller.contactos.value)..add(_persona);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Agregar Contacto',
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
