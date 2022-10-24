//Como tendremos en cuenta el tiempo sera de metodo futuro.
import 'dart:io';

Future<bool> checkInternet() async {
  //Ponemos un trycatch
  try{
        //Con esto revisara si esta conectado a una red.
      var resultado = await InternetAddress.lookup("google.com");
      if (resultado.isEmpty && resultado[0].rawAddress.isEmpty) {
        return false;
      }
      return true;
  } on SocketException catch(e){ 
    return false;
  }
}
