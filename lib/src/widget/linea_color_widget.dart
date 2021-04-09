import 'package:flutter/material.dart';

class LineaColorWidget extends StatelessWidget {
  final double ancho;
  final double alto;
  final Color color;
  final double bordeRedondoDerecho;
  final double bordeRedondoIzquierdo;
  final double offsetSombra;

  const LineaColorWidget({
    this.ancho = 100.0,
    this.alto = 1,
    this.color = Colors.grey,
    this.bordeRedondoDerecho = 0.0,
    this.bordeRedondoIzquierdo = 0.0,
    this.offsetSombra = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(this.bordeRedondoIzquierdo),
              right: Radius.circular(this.bordeRedondoDerecho)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              offset: Offset(0, offsetSombra),
              blurRadius: 2,
              spreadRadius: 0,
            )
          ]),
    );
  }
}
