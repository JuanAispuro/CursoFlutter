import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //this is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(
        color: Colors.amberAccent,
        //Style para editar.
        //Center widget de posicionamiento.
        child: Center(
          child: Text(
            'Primer widget',
            textAlign: TextAlign.center,
            style: TextStyle(decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
