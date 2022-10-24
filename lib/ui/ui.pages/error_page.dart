import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  //Para recibir el error es con FlutterErrorDetails
  final FlutterErrorDetails? details;
  ErrorPage({this.details});
  //El contexto de y stack del error obtenido.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              //Para volver a la pagina anterior
            },child: Text('Reportar Error'),
          ),
        ),
        );
  }
}
