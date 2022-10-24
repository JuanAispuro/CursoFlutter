import 'package:image_picker/image_picker.dart';

class FileService {
  //Instancearemos dos funciones.

  //función para obtener el archivo.
  static Future<String> getImage({bool camera = false}) async {
    var image = await ImagePicker.platform
        //Mini if
        .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    return image!.path;
  }
}
