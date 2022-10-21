import 'package:flutter/cupertino.dart';

class ThemeController {
  ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

  //Asi se pone el constructor de tipo privado.
  static final ThemeController instancia = ThemeController._();
  ThemeController._();
  //Metodo para cambiar el valor.
  void ChangeTheme(bool value) {
    isDark.value = value;
  }
}
