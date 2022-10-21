import 'package:flutter/material.dart';

class FormContactoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Nuevapantalla
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Nuevo Contacto'),
      ),
      body: Center(
        //The RaisedButton is deprecated .
        child: ElevatedButton(
          onPressed: () {
            //Usar el (pop) Cuando se utilice para las alertas
            // Navigator.of(context).pop(); //pop para regresar a la ruta anterior.
            Navigator.pop((context)); //Los dos funcionand e la misma forma
          },
          child:
            Text('ir hacia atras'),
        ),
      ),
    );
  }
}
