import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final double alto;
  final double ancho;
  final IconData icono;
  final bool iconoIzquida;
  final Color colorFondo;
  final String hindText;

  const TextfieldWidget(
      {this.alto = 60,
      this.ancho = 250,
      this.icono = Icons.ac_unit,
      this.iconoIzquida = false,
      this.colorFondo = Colors.grey,
      this.hindText = ''});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        width: ancho,
        height: alto - 12,
        decoration: BoxDecoration(
            color: colorFondo, borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: <Widget>[
            if (iconoIzquida)
              Container(
                width: 40,
                height: alto,
                child: Icon(
                  icono,
                  color: Colors.white,
                ),
              ),
            Container(
                alignment: Alignment.center,
                width: ancho - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 0, color: Colors.white),
                ),
                padding: EdgeInsets.all(0),
                child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                    decoration: new InputDecoration(
                      hintText: hindText,
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      border: InputBorder.none,
                    ))),
            if (!iconoIzquida)
              Container(
                width: 40,
                height: alto,
                child: Icon(
                  icono,
                  color: Colors.white,
                ),
              )
          ],
        ),
      ),
    );
  }
}
