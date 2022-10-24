import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  //Crearemos un metodo de escritura y uno de lectura la volvemos asincrona
 static void writestring({String? key, String? value}) async {
    //recibe como parametro el valor que vamos a almacenar, asignandole un alias
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString(key!, value!);
  }

  //Método de lectura que sera de tipo futuro que son aquellos que se utilizan por si se necesita esperar.
  static Future<String> readString({String? key}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    //En caso de que sea nulo se regresa una cadena vacia.
    return shared.getString(key!) ?? "";
  }
}
