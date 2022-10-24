// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:curso_flutter_basico/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:curso_flutter_basico/main.dart';

void main() {
  //Borramos todo

  //Primera prueba primero nos pide una prueba
  // test(description, body) - Sintaxis
  //movemos el main_controller.
  //Group es para juntar varios test
  //funcion anonima  (){}
  group('Pruebas para main controller', () {
    test('Prueba del presionado de Boton', () {
      // expect(actual, matcher) actual es el proceso y matcher el valor que quieras que tenga.
      expect(presionadDeBoton(), 'Controlador Presionado');
      //La prueba fallo por que el resultado que pusimos es diferentes al que necesitamos.
    });
  test('Calcular valor', () {
    //Mando el nuevo y yo espero el 600 (Obvio dara error)
    expect(CalcularElemento(9), 900);
  });
});
}

