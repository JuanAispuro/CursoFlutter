import 'dart:convert';

import 'package:curso_flutter_basico/services/shared_preferences.dart';
import 'package:flutter/material.dart';

class InformacionUusarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        //Para espacios
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        //Es children widget por la variedad de widget que usaremos
        children: <Widget>[
          //Creamos otros builder
          FutureBuilder(
            future: SharedPreferencesServices.readString(key: 'imagen'),
            builder: (context, resultado){
            if(resultado.hasData){
                  return Container(
                height: 150.0,
                width: 150.0,
                child: Image.memory(base64Decode(resultado.data.toString()), fit: BoxFit.cover),
                );
            }else{
             return Container(
                      height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.grey,
                      //Para imagen
                      image: DecorationImage(
                          image: NetworkImage(
                              //Con fit: Boxfit es para que se ajuste al espacio.
                              'https://i.pinimg.com/originals/72/c5/e1/72c5e19fb68855faffb76cc22d92c791.png'),
                          fit: BoxFit.cover)),
                );}
          }
          ),
          //Para el json es con FutureBuilder de manera que usa cualquier recurso externo, es este caso json.
          //Usando metodos asincronos.
          FutureBuilder(
            //La cadena loadstring es el resultado del json
            future:
                DefaultAssetBundle.of(context).loadString("assets/data.json"),
            //Todos los metodos builder necesitan el (context)
            builder: (context, resultado) {
              if (resultado.hasData) {
                final data = jsonDecode(resultado.data.toString());

                return Column(
                  children: <Widget>[
                    Text(
                      data['Nombre'],
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 8.0),// para separarlos
                    Text(
                      data['telefono'],
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
