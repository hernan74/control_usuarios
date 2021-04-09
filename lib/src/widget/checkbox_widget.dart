import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class CheckBoxWidget extends StatelessWidget {
  final String titulo;
  final double ancho;
  final double alto;
  final Color checkColor;
  final Color fondoCheckColor;
  final Function(bool) onChanged;
  final bool valor;
  final double bordeRedondeado;

  const CheckBoxWidget(
      {this.titulo = '',
      this.ancho = 100,
      this.alto = 60,
      this.checkColor = Colors.grey,
      this.onChanged,
      this.fondoCheckColor = Colors.grey,
      this.bordeRedondeado = 50,
      this.valor = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.ancho,
      height: this.alto,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.bordeRedondeado),
        ),
        child: Row(
          children: <Widget>[
            Spacer(),
            Text(
              this.titulo,
              style: TextStyle(
                  fontSize: estilo.sizeText,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Spacer(),
            Checkbox(
                checkColor: this.checkColor,
                activeColor: this.fondoCheckColor,
                value: this.valor,
                onChanged: this.onChanged)
          ],
        ),
      ),
    );
  }
}
