import 'package:curso_flutter_basico/services/internet_services.dart';
import 'package:http/http.dart' as http;

//Proceso con future
Future<String?> obtenerNoticias() async {
  //Usamos http get
  //El metodo http.get esta viejo el nuevo es
  //http.get(Uri.parse())
  //Realiza un if si el metodo checkinternet esta activo.
  if (await checkInternet()) {
    //Lo encerramos todo dentro de un try catch
    try {
      var respuesta = (Uri.parse(
          "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=O5ECiyROKPswh9tx3V1DQF8es0n4dlA8"));
      var _response = await http
          .get(respuesta, headers: {'Content-Type': 'application/json'});
      //pondrmeos la función.
      // print(respuesta.body);
      return _response.body;
    } catch (e) {
      print(e);
      return null;
    }
  }
  //en caso que no tenga retornamos un valor nulo
  return null;
}
