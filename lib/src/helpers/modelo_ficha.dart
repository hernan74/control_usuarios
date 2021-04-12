import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Modeloficha {
  final String titulo;
  final IconData icono;
  final tipoDato;

  Modeloficha(this.titulo, this.icono, this.tipoDato);
}

List<Modeloficha> modeloficha = [
  Modeloficha('Nombre', FontAwesomeIcons.user,'String'),
  Modeloficha('Apellido', FontAwesomeIcons.user,'String'),
  Modeloficha('Direccion', FontAwesomeIcons.directions,'String'),
  Modeloficha('Telefono', FontAwesomeIcons.phone,'number'),
  Modeloficha('Fecha Nacimiento', FontAwesomeIcons.calendarAlt,'date'),
];
