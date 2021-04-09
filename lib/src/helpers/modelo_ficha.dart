import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Modeloficha {
  final String titulo;
  final IconData icono;

  Modeloficha(this.titulo, this.icono);
}

List<Modeloficha> modeloficha = [
  Modeloficha('Nombre', FontAwesomeIcons.user),
  Modeloficha('Apellido', FontAwesomeIcons.user),
  Modeloficha('Direccion', FontAwesomeIcons.directions),
  Modeloficha('Telefono', FontAwesomeIcons.phone),
  Modeloficha('Fecha Nacimiento', FontAwesomeIcons.calendarAlt),
];
