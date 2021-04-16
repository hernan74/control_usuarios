import 'package:control_usuarios/src/helpers/import_helpers.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class ItemListaHistorial extends StatelessWidget {
  final String fecha;
  final String motivo;
  final bool sincronizado;
  final TextStyle estiloTitulo =
      new TextStyle(fontSize: 16, color: Colors.grey);
  final TextStyle estiloContenido = new TextStyle(
      fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black);

  ItemListaHistorial(
      {@required this.fecha,
      @required this.motivo,
      @required this.sincronizado});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: sizeScreemUtil(
                sizeActual: size.width * 2 / 100, sizeMin: 5, sizeMax: 15),
          ),
          FaIcon(
            FontAwesomeIcons.history,
            color: estilo.colorPrimarioUno,
            size: sizeScreemUtil(
                sizeActual: size.width * 9 / 100, sizeMin: 10, sizeMax: 50),
          ),
          SizedBox(
            width: sizeScreemUtil(
                sizeActual: size.width * 2 / 100, sizeMin: 5, sizeMax: 15),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fecha',
                  style: estiloTitulo,
                ),
                Text(fecha, style: estiloContenido),
                Text('Motivo', style: estiloTitulo),
                Text(motivo, style: estiloContenido)
              ]),
          Spacer(),
          Container(
            height: double.infinity,
            child: FaIcon(
              this.sincronizado ? Icons.cloud_done_outlined : Icons.cloud_off,
              color: this.sincronizado ? Colors.greenAccent : Colors.redAccent,
              size: sizeScreemUtil(
                  sizeActual: size.width * 5 / 100, sizeMin: 7, sizeMax: 25),
            ),
          ),
          SizedBox(
            width: sizeScreemUtil(
                sizeActual: size.width * 2 / 100, sizeMin: 5, sizeMax: 15),
          ),
        ],
      ),
    );
  }
}
