// ignore_for_file: depend_on_referenced_packages

import 'package:image_picker/image_picker.dart';

/// creamos la función que captura la imagen

Future<XFile?> getImage() async {
  /// en la documentación dice cómo usar el imagePicker
  /// que puede ser tanto una imagen como un video
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  /// una vez capturada esa imagen (fijarse que la variable espera a la función )
  /// le pusimos que la función devuelve un XFile con el signo de pregunta pues puede ser NULL el return
  return image;
}
