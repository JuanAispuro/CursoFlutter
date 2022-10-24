import 'dart:convert';

import 'package:curso_flutter_basico/models/noticias_modelo.dart';
import 'package:curso_flutter_basico/services/http_requestservices.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasPage extends StatelessWidget {
  //Lista modelo.
  List<NoticiaModelo> noticias = [];
  @override
  Widget build(BuildContext context) {
    //Como usamos asincronos retornamos el futurebuilder.
    return FutureBuilder(
        future: obtenerNoticias(),
        builder: (context, _response) {
          //Preguntamos si hay datos.
          if (_response.hasData) {
            //Creamos una variable para decodificar el json.
            List<dynamic> noticiasJson = jsonDecode(_response.data!)['results'];
            noticiasJson.forEach((element) {
              //Objeto noticia modelo
              NoticiaModelo _noticia = NoticiaModelo.fromJson(element);
              noticias.add(_noticia);
            });
            //Para mostrar
            return ListView.builder(
                itemCount: noticias.length,
                itemBuilder: (context, puntero) {
                  return ListTile(
                    //el leading es para poner el icono de numreo de revista.
                    onTap: () {
                      launch(noticias[puntero].url!);
                    },
                    leading: CircleAvatar(
                      child: Text(puntero.toString()),
                    ),
                    title: Text(noticias[puntero].titulo!),
                    subtitle: Text(noticias[puntero].resumen!),
                  );
                });
          }
          return Center(child: CircularProgressIndicator()); //Circulo de espera
        });
  }
}
