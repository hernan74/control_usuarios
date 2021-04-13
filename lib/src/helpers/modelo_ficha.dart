import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Modeloficha {
  final int indice;
  final String titulo;
  final IconData icono;
  final tipoDato;

  Modeloficha(this.indice, this.titulo, this.icono, this.tipoDato);
}

List<Modeloficha> modeloficha = [
  Modeloficha(0, 'Nombre', FontAwesomeIcons.user, 'String'),
  Modeloficha(1, 'Apellido', FontAwesomeIcons.user, 'String'),
  Modeloficha(2, 'Direccion', FontAwesomeIcons.directions, 'String'),
  Modeloficha(3, 'Telefono', FontAwesomeIcons.phone, 'number'),
  Modeloficha(4, 'Fecha Nacimiento', FontAwesomeIcons.calendarAlt, 'date'),
];
