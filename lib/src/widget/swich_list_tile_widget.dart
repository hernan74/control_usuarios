import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class SwichListTile extends StatefulWidget {
  final String titulo;
  final double ancho;
  final double alto;
  final Color checkColor;
  final Color fondoCheckColor;

  final double bordeRedondeado;

  const SwichListTile({
    this.titulo = '',
    this.ancho = 100,
    this.alto = 60,
    this.checkColor = Colors.grey,
    this.fondoCheckColor = Colors.grey,
    this.bordeRedondeado = 50,
  });

  @override
  _SwichListTileState createState() => _SwichListTileState();
}

class _SwichListTileState extends State<SwichListTile> {
  bool seleccion = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.ancho,
      height: this.widget.alto,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.widget.bordeRedondeado),
        ),
        child: SwitchListTile(
          title: Text(this.widget.titulo,
              style: TextStyle(
                  fontSize: estilo.sizeText,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          onChanged: (value) {
            setState(() {
              this.seleccion = value;
            });
          },
          value: this.seleccion,
          activeColor: this.widget.fondoCheckColor,
        ),
      ),
    );
  }
}
