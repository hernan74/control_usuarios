import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:image_picker/image_picker.dart';

Future<Widget> imagePickerFutureWidget(ImageSource origin) async {
  final _picker = ImagePicker();

  final pickedFile = await _picker.getImage(
    source: origin,
  );
  if (pickedFile == null) return null;
  Image nuevaImagen;
  if (kIsWeb) {
    PickedFile aux = new PickedFile(pickedFile.path);
    nuevaImagen = Image.network(
      aux.path,
      fit: BoxFit.cover,
    );
  } else {
    File foto = File(pickedFile.path);

    nuevaImagen = Image.file(foto, fit: BoxFit.cover);
  }
  return nuevaImagen;
}
